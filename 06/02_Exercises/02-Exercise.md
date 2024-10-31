### Exercise 2: Scaling up a Deployment
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)  
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ)
3. Previous exercise is running successfully.
#### Tasks
Scale up your deployment on Minikube.
#### Your solution
1. List your Deployments:
```
#??
```
2. List the ReplicaSet created by the Deployment
```
#??
```
Notice that the name of the ReplicaSet is always formatted as 
[DEPLOYMENT-NAME]-[RANDOM-STRING]. 
The random string is randomly generated and uses the pod-template-hash as a seed.
3. Scale the Deployment to 4 replicas:
```
#??
```
5. List your Deployments once again:
```
#??
```
The change was applied, and you should have 4 instances of the application available. 
6. Check if the number of Pods changed:
```
#??
```
There are 4 Pods now, with different IP addresses. 
7. Check the change was registered in the Deployment events log 
```
#??
```
You can also view in the output of this command that there are 4 replicas now.