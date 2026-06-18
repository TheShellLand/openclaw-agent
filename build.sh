#!/bin/bash
# build image 

image="openclaw-agent"

set -xe

docker pull docker:latest

docker build -t $image:latest -f Dockerfile .

docker images | grep $image
