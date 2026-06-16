#!/bin/bash
# build image 

image="openclaw-agent"

set -xe

docker build -t $image:latest -f Dockerfile .

docker images | grep $image
