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
#??
#??
#??
#??

# Set host and port variable from the user input
#??
#??
#??

# write a tool title
#??
#??

# 1. do Health check
#??
#??

# 2. do Echo test
#??
#??

# 3. request Client IP
#??
#??

# 4. write Environment variables (first 5 lines)
#??
#??

# 5. list Filesystem
#??
#??

# 6. test External connectivity (to google.com:80)
#??
#??

echo -e "\n-------------------------------------"
echo "🎉 All tests completed!"
