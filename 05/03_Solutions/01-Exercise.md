### Exercise 1: Deploy a sample app
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)  
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ) 
#### Tasks
Fill in the gaps to deploy the app ```google-samples/kubernetes-bootcamp:v1``` from
the registry ```gcr.io``` on your Minikube.
#### Your solution
1. Create a cluster with minikube
```bash
minikube start #??
```
2. Deploy the app with the name ```bzz-app-2```
```bash
kubectl create deployment bzz-app-2 --image=gcr.io/google-samples/kubernetes-bootcamp:v1 #?? 
```
3. Display the deployment
```bash
kubectl get deployments #??
```
