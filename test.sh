#!/bin/bash
# test image 

image="openclaw-agent"

set -xe

docker run --rm -it \
  -v pi-agent:/root/.pi \
  --entrypoint /bin/bash \
  $image
