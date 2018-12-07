#! /usr/bin/bash

docker build -t ${docker_name} ${dockerfile}
docker inspect --format='{{.Id}}' ${docker_name} > ${digest}