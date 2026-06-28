# Docker Learning

A practical guide to Docker with hands-on examples.

## Files

- **Dockerfile** — Main Dockerfile for app.py (with environment variable support)
- **Dockerfile_Module2** — Alternative Dockerfile for main.py
- **app.py** — Simple Python app that reads APP_NAME environment variable
- **main.py** — Simple Python app that prints 1-5 and a greeting
- **requirements.txt** — Python dependencies

## Quick Start

### Build the image
```bash
docker build -f Dockerfile -t myapp:1.0 .
```

### Run with environment variable
```bash
docker run --rm -e APP_NAME=Dev myapp:1.0
```

### Push to GitHub Container Registry
```bash
docker tag myapp:1.0 ghcr.io/YOUR_USERNAME/myapp:1.0
docker push ghcr.io/YOUR_USERNAME/myapp:1.0
```

### Pull from GitHub Container Registry
```bash
docker pull ghcr.io/YOUR_USERNAME/myapp:1.0
```

## Key Concepts

- **Dockerfile** — Configuration file to build Docker images
- **Image** — Packaged application with all dependencies
- **Container** — Running instance of an image
- **Environment variables** — Pass config using `-e` flag
- **Volumes** — Persist data using `-v` flag
- **Port mapping** — Map container port to host using `-p` flag