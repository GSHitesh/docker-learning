#!/bin/bash

# Exercise 4 — Build the image and run it with a named volume so the
# numbers written by the script persist outside the container.
docker build -f Dockerfile -t mynumber:1.0 .

docker run -d --name number1 -v mydata:/data/ mynumber:1.0


# Reference commands used while verifying the exercise:

# docker logs number1
# docker rm -f number1
# docker ps
# docker ps -a
# docker images
# ./exercise4.sh
# docker ps
# docker logs number1
# docker rm -f number1
# ./exercise4.sh
# dockerps
# docker ps
# docker build -f Dockerfile_ex4 -t mynumber:1.0 .
# docker exec -it number1 bash
# docker rm -f number1
# docker run -d --name number2 -v mydata:/data/ mynumber:1.0
# docker exec -it number2 bash
# cat /var/lib/docker/volumes/mydata/_data/example.txt
# docker rm -f number2