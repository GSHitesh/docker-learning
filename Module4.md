# Module 4 — Networking & Multi-Container Communication

This module covers how Docker containers talk to each other using user-defined
networks, DNS-based service discovery, and how to attach a container to multiple
networks.

## 1. Why a User-Defined Network?

On the default `bridge` network, containers can only reach each other by IP
address. On a **user-defined bridge network**, Docker provides an embedded DNS
server, so containers can reach each other by **name**. This is the foundation
of multi-container communication.

```bash
# Create a dedicated network for the app
docker network create shopnet

# List all networks
docker network ls
```

Example output:

```
NETWORK ID     NAME      DRIVER    SCOPE
d2472586f8de   appnet    bridge    local
9ac690accb72   bridge    bridge    local
653840b1c94c   host      host      local
e2dacfec217d   none      null      local
aab6ee9105b3   shopnet   bridge    local
```

## 2. Starting Containers on the Same Network

Run the backend (Redis) and the web container on `shopnet` so they share a DNS
namespace.

```bash
# Backend service
docker run -d --name redis --network shopnet redis:7

# Web service, pointed at redis by name (not IP)
docker run -d --name nginx --network shopnet -p 8080:8080 \
  -e REDIS_URL=redis://redis:6379 nginx
```

Verify both are running:

```bash
docker ps
```

## 3. Common Pitfalls

### Container name already in use
If a container exited but still exists, its name is reserved. Remove it before
reusing the name.

```bash
docker ps -a            # show stopped containers too
docker rm web           # free up the name
```

### A container exits immediately
`myapp:1.2` ran `python3 main.py`, which finished and exited (`Exited (0)`).
Short-lived processes won't stay up — you need a long-running process (like the
nginx server) for a persistent service.

## 4. Verifying Connectivity by Name

### DNS resolution without extra tools
The minimal `nginx` image has no `ping`, but `getent` is available and confirms
name resolution:

```bash
docker exec -it nginx getent hosts redis
# 172.19.0.2      redis
```

### Using ping (must be installed first)
The official `nginx` image ships without `iputils-ping`, so `ping` fails with
`executable file not found in $PATH`. Install it inside the running container:

```bash
docker exec -it nginx sh -c "apt-get update && apt-get install -y iputils-ping"
docker exec -it nginx ping -c1 redis
```

Successful result:

```
PING redis (172.19.0.2) 56(84) bytes of data.
64 bytes from redis.shopnet (172.19.0.2): icmp_seq=1 ttl=64 time=0.176 ms
```

> Note: installing packages into a running container is temporary and lost when
> the container is recreated. For a permanent fix, add the package in a
> Dockerfile, or test connectivity from a `busybox`/`alpine` helper container.

## 5. Inspecting a Container's Networks

```bash
docker inspect -f '{{json .NetworkSettings.Networks}}' nginx | jq .
```

Key fields to read:

- **NetworkID / network name** — which network the endpoint belongs to
- **IPAddress** — the container's IP on that network
- **Gateway** — the bridge gateway
- **DNSNames** — the names other containers can use to reach it
  (e.g. `nginx` and its short container ID)

## 6. Connecting a Container to Multiple Networks

A container can be attached to more than one network at the same time. This is
useful for placing a proxy on both a public and a private network.

```bash
docker network connect appnet nginx
```

After this, inspecting `nginx` shows two endpoints:

- `shopnet` → `172.19.0.3`
- `appnet`  → `172.18.0.2`

Each network gives the container a separate IP, gateway, and DNS scope, while
keeping the same DNS name on every network it joins.

## Command Reference

| Task | Command |
| --- | --- |
| Create a network | `docker network create shopnet` |
| List networks | `docker network ls` |
| Run on a network | `docker run --network shopnet ...` |
| Attach extra network | `docker network connect appnet nginx` |
| Resolve a name | `docker exec -it nginx getent hosts redis` |
| Inspect networks | `docker inspect -f '{{json .NetworkSettings.Networks}}' nginx \| jq .` |
| Remove a container | `docker rm <name>` |

## Key Takeaways

- Use **user-defined networks** for automatic DNS-based service discovery.
- Reference services by **name**, not IP — names are stable, IPs are not.
- Minimal images may lack debugging tools (`ping`); install them or use a
  helper container.
- A container can join **multiple networks**, each with its own IP and gateway.

