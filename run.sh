#!/bin/bash 
# run agent in docker

image="openclaw-agent"

set -e

docker network create agents >/dev/null 2>&1 || :
docker rm -f $image >/dev/null || :

set -xe

docker run -it -d \
  --name $image \
  --restart always \
  --network agents \
  -p 0.0.0.0:3002:3001 \
  -p 0.0.0.0:18789:18789 \
  --memory-reservation=2g \
  -v $image:/root/.openclaw/state \
  -v $image-pi:/root/.pi/agent/sessions \
  -v $image-ssh:/root/.ssh \
  $image "$@"
