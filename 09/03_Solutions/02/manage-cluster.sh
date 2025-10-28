#!/bin/bash
#
#
if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "argument 1 - action: " \
    "v=validate declaration, " \
    "a=deploy & expose service, i=view cluster info" \
    "f=Forward port, p=show forwarded port" \
    "s=remove service, d=remove deployment" \
    "e=export configuration in yaml" \
    "Exit script."
  exit 1
fi

# set variables if you need them
# i.e. deployment name, service name, configuration, port
NAME="app4" #??
SVC="app4-svc" #??
CONFIG="cluster.yaml" #??
PORT="4000" #??

# switch case
case $1 in
v)
  printf "Validate configuration ...\n"
  kubectl apply -f ${CONFIG} --dry-run=client --validate #??
  ;;
a)
  printf "Applying configuration ...\n"
  kubectl apply -f ${CONFIG} #??
  ;;
i)
  printf "Get Cluster info ...\n"
  printf "\nDeployments ...\n"
  kubectl get deployments #??
  printf "\nServices ...\n"
  kubectl get services #??
  printf "\nPods ...\n"
  kubectl get pods #??
  printf "\nDescription of deployment ...\n"
  kubectl describe deployment ${NAME} #??
  ;;
f)
  printf "%s\n" \
  "forward port ${PORT} to the same port" \
  "then open a new terminal" \
  "and access the app with curl http://localhost:${PORT}/"
  kubectl port-forward svc/${SVC} ${PORT}:${PORT} #??
  ;;
w)
  # set watch period
  TIME=5 #??
  printf "\nObserve self-healing mechanism every %d seconds..\n" ${TIME}
  watch -n ${TIME} -d kubectl get pods #??
  ;;
p)
  printf "%s\n" \
  "Show forwarded ports"
  ps -o pid,command -C kubectl | grep 'port-forward' | awk '{print "PID="$1, " ->", $0}'
  ;;
s)
  printf "Delete service ...\n"
  kubectl delete service "${SVC}" #??
  ;;
d)
  printf "Delete deployment ...\n"
  kubectl delete deployment "${NAME}" #??
  ;;
e)
  printf "\nExport configuration in yaml ...\n"
  kubectl get deployment ${NAME} -o yaml #??
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac


