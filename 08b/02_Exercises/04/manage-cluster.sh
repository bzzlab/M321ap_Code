#!/bin/bash
#
#
if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "argument 1 - action: " \
    "0=validate declaration, " \
    "1=deploy & expose service, 2=view cluster info" \
    "3=Forward port, 4=show forwarded port" \
    "5=remove service, 6=remove deployment" \
    "e=export configuration in yaml" \
    "Exit script."
  exit 1
fi

# set variables if you need them
# i.e. deployment name, service name, configuration, port
#??
#??
#??
#??

# switch case
case $1 in
0)
  printf "Validate configuration ...\n"
#??
  ;;
1)
  printf "Applying configuration ...\n"
#??
  ;;
2)
  printf "Get Cluster info ...\n"
  printf "\nDeployments ...\n"
#??
  printf "\nServices ...\n"
#??
  printf "\nPods ...\n"
#??
  printf "\nDescription of deployment ...\n"
#??
  ;;
3)
  printf "%s\n" \
  "forward port ${PORT} to the same port" \
  "then open a new terminal" \
  "and access the app with curl http://localhost:${PORT}/"
#??
#??
#??
  ;;
4)
  printf "%s\n" \
  "Show forwarded ports"
  ps -o pid,command -C kubectl | grep 'port-forward' | awk '{print "PID="$1, " ->", $0}'
  ;;
5)
  printf "Delete service ...\n"
#??
  ;;
6)
  printf "Delete deployment ...\n"
#??
  ;;
e)
  printf "\nExport configuration in yaml ...\n"
#??
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac


