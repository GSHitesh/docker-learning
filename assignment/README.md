# Docker Assignment

Hands-on exercises practicing core Docker workflows: running containers, building images, tagging, and using volumes.

## Layout

| Folder | Topic | Key files |
| --- | --- | --- |
| [exercise1/](exercise1) | Run an nginx container with a host port mapping | `exercise1.sh` |
| [exercise2/](exercise2) | Build a Python image from a Dockerfile, then tag it | `Dockerfile`, `app.py`, `exercise2.sh` |
| [exercise4/](exercise4) | Persist container output with a named volume | `Dockerfile`, `main.py`, `exercise4.sh` |
| [static/](static) | Sample static HTML page | `index.html` |

> Exercise 3 (additional tagging) is demonstrated as commented commands inside [exercise2/exercise2.sh](exercise2/exercise2.sh).

## Running an exercise

Each `exerciseN.sh` is self-contained. From inside the exercise folder:

```bash
cd exercise2
chmod +x exercise2.sh
./exercise2.sh
```

The captured sample outputs are kept as comments at the bottom of each script for reference.
