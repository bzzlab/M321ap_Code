#!/bin/bash
# build and run container based on a Dockerfile
#
PARAMS='web.conf'
if [ ! -f $PARAMS ]; then
    echo $PARAMS does not exist!
    exit 2
  fi
source $PARAMS
#??
# List images
#??
# Run image with and name it (see variable)
#??
# Test container
#??

