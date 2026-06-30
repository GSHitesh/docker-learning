#!/bin/bash

# Module 7 Docker assignment — Exercise 1
# Launches an nginx container in detached mode and exposes it on host port 8081.

docker run --rm -d --name web1 -p 8081:80 nginx:latest


# Sample run output:

# ❯ ./Module7.sh
# 6d1cdce548f6cb0863d93458314de45bd50f5552fc4ca2f8034b163e535b080a
# ❯ docker ps
# CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                                     NAMES
# 6d1cdce548f6   nginx:latest   "/docker-entrypoint.…"   6 seconds ago   Up 5 seconds   0.0.0.0:8081->80/tcp, [::]:8081->80/tcp   web1
# ❯ curl -s http://localhost:8081 | head -5
# <!DOCTYPE html>
# <html>
# <head>
# <title>Welcome to nginx!</title>
# <style>
# ❯ docker logs web1
# /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
# /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
# /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
# 10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
# 10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
# /docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
# /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
# /docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
# /docker-entrypoint.sh: Configuration complete; ready for start up
# 2026/06/30 11:30:15 [notice] 1#1: using the "epoll" event method
# 2026/06/30 11:30:15 [notice] 1#1: nginx/1.31.2
# 2026/06/30 11:30:15 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19) 
# 2026/06/30 11:30:15 [notice] 1#1: OS: Linux 6.8.0-124-generic
# 2026/06/30 11:30:15 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1024:524288
# 2026/06/30 11:30:15 [notice] 1#1: start worker processes
# 2026/06/30 11:30:15 [notice] 1#1: start worker process 29
# 2026/06/30 11:30:15 [notice] 1#1: start worker process 30
# 2026/06/30 11:30:15 [notice] 1#1: start worker process 31
# 2026/06/30 11:30:15 [notice] 1#1: start worker process 32
# 172.17.0.1 - - [30/Jun/2026:11:30:28 +0000] "GET / HTTP/1.1" 200 896 "-" "curl/8.5.0" "-"


