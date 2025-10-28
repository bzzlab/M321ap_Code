#!/bin/bash
#
# Check and import app parameters
PARAMS='AppParams.conf'
if [ ! -f $PARAMS ]; then  #??
    echo $PARAMS does not exist! #??
    exit 2  #??
  fi  #??
source $PARAMS #??
# Tag and push created image to your registry
docker tag "$image" readydocker1/selfhealing:latest #??
docker push readydocker1/selfhealing:latest #??

