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
NAME="app4" #??
SVC="app4-svc" #??
CONFIG="cluster.yaml" #??
PORT="5000" #??

# switch case
case $1 in
0)
  printf "Validate configuration ...\n"
  kubectl apply -f ${CONFIG} --dry-run=client --validate #??
  ;;
1)
  printf "Applying configuration ...\n"
  kubectl apply -f ${CONFIG} #??
  ;;
2)
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
3)
  printf "%s\n" \
  "forward port ${PORT} to the same port" \
  "then open a new terminal" \
  "and access the app with curl http://localhost:${PORT}/"
  kubectl port-forward svc/${SVC} ${PORT}:${PORT} #??
  # Alternativ: let minikube open a tunnel #??
  # minikube service app4-svc --url #??
  ;;
4)
  printf "%s\n" \
  "Show forwarded ports"
  ps -o pid,command -C kubectl | grep 'port-forward' | awk '{print "PID="$1, " ->", $0}'
  ;;
5)
  printf "Delete service ...\n"
  kubectl delete service "${SVC}" #??
  ;;
6)
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


