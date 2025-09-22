#!/bin/bash
:<<'TASK'
Study case:
'agnhost netexec' server as little Swiss-army for networking tests

Read the code comments and fill the gaps in the bash-script to obtain
networking testing tool.
General usage is: ./test-netexec.sh <EXTERNAL-IP> <PORT>

Example: ./test-netexec.sh 192.168.49.2 32045
Or if using minikube tunnel with LoadBalancer:
./test-netexec.sh 127.0.0.1 8080

Run it with your Minikube IP & NodePort:
./test-netexec.sh $(minikube ip) 32045
(replace 32045 with your actual NodePort)

Remark: In order to program this script you need
to read all articles in 05/01_Intro/* and REVIEW them in
your K8s cluster before completing this task. Thus
you gain a better understanding of the task.

TASK

# Check number of required parameters.
# Exit with a message if it's not the case.
if [ $# -ne 2 ]; then #??
  echo "Usage: $0 <EXTERNAL-IP> <PORT>" #??
  exit 1 #??
fi #??

# Set host and port variable from the user input
HOST=$1 #??
PORT=$2 #??
BASE="http://$HOST:$PORT" #??

# write a tool title
echo "🔎 Testing agnhost netexec at $BASE" #??
echo "-------------------------------------" #??

# 1. do Health check
echo -e "\n✅ Health check:" #??
curl -s -w "HTTP %{http_code}\n" "$BASE/healthz" #??

# 2. do Echo test
echo -e "\n✅ Echo test:" #??
curl -s "$BASE/echo?msg=hello-from-netexec" #??

# 3. request Client IP
echo -e "\n\n✅ Client IP:" #??
curl -s "$BASE/clientip" #??

# 4. write Environment variables (first 5 lines)
echo -e "\n\n✅ Env variables (first 5 lines):" #??
curl -s "$BASE/env" | head -n 5 #??

# 5. list Filesystem
echo -e "\n\n✅ Filesystem listing (/):" #??
curl -s "$BASE/ls?path=/" | head -n 10 #??

# 6. test External connectivity (to google.com:80)
echo -e "\n\n✅ Dial test (google.com:80):" #??
curl -s "$BASE/dial?host=google.com&port=80" #??

echo -e "\n-------------------------------------"
echo "🎉 All tests completed!"
