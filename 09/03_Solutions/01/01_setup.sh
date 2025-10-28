#!/bin/bash
#
# Check and import app parameters
PARAMS='AppParams.conf'
if [ ! -f $PARAMS ]; then  #??
    echo $PARAMS does not exist! #??
    exit 2  #??
  fi  #??
source $PARAMS #??
# Build a dockerfile with tag -t
docker build -t "$image" -f "$file" . #??
# List images
docker image ls #??


