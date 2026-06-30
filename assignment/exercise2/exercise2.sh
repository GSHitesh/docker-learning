#!/bin/bash

# Exercise 2 — Build a Python image from the local Dockerfile and tag it as hello-py:1.0.
docker build -f Dockerfile -t hello-py:1.0 .

# Sample run output:

#  docker run --rm -d  hello-py:1.0
# b7b7aba17aca7807b1b4834d84b7df99234ed5032b2572380142006fefb978b9
# ❯ docker run --rm   hello-py:1.0
# This is the exercise 2 dockerfile


# Exercise 3 — Add additional tags to the same image (multiple names, one image ID).

# ❯ docker tag hello-py:1.0 hello-py:latest
# ❯ docker images
#                                                                                                        i Info →   U  In Use
# IMAGE                                     ID             DISK USAGE   CONTENT SIZE   EXTRA
# docker-learning-api:latest                ba80ab9df27d        213MB         56.5MB        
# docker-learning-web:latest                06fbb997a8d1        195MB         47.6MB        
# ghcr.io/github/github-mcp-server:latest   e3816a476a97       60.7MB         15.3MB        
# hello-py:1.0                              b6d7437ac034        177MB         43.2MB        
# hello-py:latest                           b6d7437ac034        177MB         43.2MB        
# hello-world:latest                        0e760fdfbc48       25.9kB         9.49kB        
# myapi:1.0                                 376c791489f9        213MB         56.5MB        
# myapp1:1                                  52e9374e0f17        213MB         56.5MB    U   
# myapp:1.0                                 52e9374e0f17        213MB         56.5MB    U   
# nginx:alpine                              54f2a904c251       93.3MB         26.9MB        
# nginx:latest                              ec4ed8b5299e        241MB           66MB    U   
# postgres:16                               fe03a7605299        642MB          166MB        
# redis:7-alpine                            6ab0b6e73817       57.8MB         16.8MB        
# ❯ docker tag hello-py:1.0 myrepo/hello-py:1.0
# ❯ docker images
#                                                                                                        i Info →   U  In Use
# IMAGE                                     ID             DISK USAGE   CONTENT SIZE   EXTRA
# docker-learning-api:latest                ba80ab9df27d        213MB         56.5MB        
# docker-learning-web:latest                06fbb997a8d1        195MB         47.6MB        
# ghcr.io/github/github-mcp-server:latest   e3816a476a97       60.7MB         15.3MB        
# hello-py:1.0                              b6d7437ac034        177MB         43.2MB        
# hello-py:latest                           b6d7437ac034        177MB         43.2MB        
# hello-world:latest                        0e760fdfbc48       25.9kB         9.49kB        
# myapi:1.0                                 376c791489f9        213MB         56.5MB        
# myapp1:1                                  52e9374e0f17        213MB         56.5MB    U   
# myapp:1.0                                 52e9374e0f17        213MB         56.5MB    U   
# myrepo/hello-py:1.0                       b6d7437ac034        177MB         43.2MB        
# nginx:alpine                              54f2a904c251       93.3MB         26.9MB        
# nginx:latest                              ec4ed8b5299e        241MB           66MB    U   
# postgres:16                               fe03a7605299        642MB          166MB        
# redis:7-alpine                            6ab0b6e73817       57.8MB         16.8MB        
#  ~/projects/docker-learning/assignment │ on main ?1 ▓▒░           