#!/bin/bash
#
# Check and import app parameters
PARAMS='AppParams.conf'
if [ ! -f $PARAMS ]; then  #??
    echo $PARAMS does not exist! #??
    exit 2  #??
  fi  #??
source $PARAMS #??

if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "1: remove container, 2: remove image" \
    "Exit script."
  exit 1
fi

case $1 in
1)
  printf "Stop and remove container %s" ${container}
  # stop container
  docker stop "$container"  #??
  # wait 3 seconds
  sleep 3  #??
  # Remove container  #??
  docker rm "$container" #??
  ;;
2)
  printf "Remove image %s" ${image}
  # Remove image
  docker rmi "$image":latest  #??
  # check removal of image
  docker image ls |grep "$image" #??
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac
