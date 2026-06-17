#!/bin/bash 
# run agent in docker

image="openclaw-agent"

set -xe

docker logs -f $image

