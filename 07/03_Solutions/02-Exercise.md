### Exercise 2: Update an App
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)  
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ)
3. Previous exercise is running successfully.
#### Tasks
Perform a rolling update of your app on Minikube.
#### Your solution
1. List your Deployments
```
kubectl get deployments #??
```
2. List the running Pods
```
kubectl get pods #??
```
3. View the current image version of the app and look for the Image field:
```
kubectl describe pods |grep Image #??
```
4. Update the image ```kubernetes-bootcamp``` of the application to version 2
from ```docker.io/jocatalin/kubernetes-bootcamp:v2```
```
kubectl set image deployments/bzz-app-4 \  #??
kubernetes-bootcamp=docker.io/jocatalin/kubernetes-bootcamp:v2  #??
```
The command notified the Deployment to use a different image for your app and 
initiated a rolling update. 
5. Check the status of the new Pods, and view the old one terminating
```
kubectl get pods #??
```