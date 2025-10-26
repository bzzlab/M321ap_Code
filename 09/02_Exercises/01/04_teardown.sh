#!/bin/bash
#
# Check and import app parameters
PARAMS='AppParams.conf'
#??
#??
#??
#??
#??

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
#??
  # wait 3 seconds
#??
#??
#??
  ;;
2)
  printf "Remove image %s" ${image}
  # Remove image
#??
  # check removal of image
#??
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac
