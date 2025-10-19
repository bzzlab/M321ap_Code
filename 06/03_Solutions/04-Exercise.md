### Exercise 4: Scaling down a Deployment
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ)
3. Previous exercise is running successfully.
#### Tasks
Scale down your existing Deployment
#### Your solution
1. Scale down the Deployment to 2 replicas
```
kubectl scale deployments/bzz-app-3 --replicas=2 #??
```
2. List the Deployments to check if the change was applied
```
kubectl get deployments #??
```
The number of replicas should have decreased to 2. 
3. List the number of Pods in wide format
```
kubectl get pods -o wide #??
```
This confirms that 2 Pods were terminated.
4. Clean up your local cluster
```
kubectl delete services/bzz-app-3 deployments/bzz-app-3 #??
```