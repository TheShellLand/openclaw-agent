#!/bin/bash

set -e

if [[ ! -z "$@" ]] ; then 
  set -x
  exec "$@"
fi

set -x

cat  ~/.openclaw/openclaw.json

exec openclaw gateway --allow-unconfigured

