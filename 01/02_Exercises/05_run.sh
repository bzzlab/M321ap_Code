#!/bin/bash
#
# Import either 01_Basic.conf or 01_Homedir.conf
#??
# If no start-argument has been provided to the bash script then ...
#??
  # print error message and exit script
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "(1): create container, (2): remove container" \
    "Exit script."
#??
#??


case $1 in
1)
  # if docker file does not exist ..
#??
#??
    # print error message and exit script
#??
#??
#??
  # Build a dockerfile with tag -t
  printf "Start building %s ..." ${file}
#??
#??
  # List images
#??
#??
#??
  # Run container based on its image
#??
  # Start bash-shell in container
#??
  ;;

2)
  # stop container
#??
  # remove image
#??
  # Check if the image still exists by filtering all
  # existing images with removed image. When output is empty then
  # image has been successfully removed.
#??
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac

