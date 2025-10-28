#!/bin/bash
#
# Check and import app parameters
PARAMS='AppParams.conf'
if [ ! -f $PARAMS ]; then  #??
    echo $PARAMS does not exist! #??
    exit 2  #??
  fi  #??
source $PARAMS #??
# Run image with specific name
docker run -itd --name "$container" -p 4000:4000 "$image" #??
# wait 2 seconds
sleep 2
# test the container with curl
curl http://localhost:4000/ #??


