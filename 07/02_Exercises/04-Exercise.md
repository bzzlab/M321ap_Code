### Exercise 4: Roll back an update
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)  
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ)
3. Previous exercise is running successfully.
#### Tasks
Roll back an updated app on Minikube.
#### Your solution
1. Perform another update by deploying an image
from ```gcr.io/google-samples/kubernetes-bootcamp:v10``` tagged with v10.
```
#??
#??
```
2. Check the status of the deployment:
```
#??
```
Notice that the output doesn't list the desired number of available Pods. 
3. List all Pods
```
#??
```
Notice that some of the Pods have a status of ImagePullBackOff.
This means that the image is not available or cannot be pulled.
Kubernetes stops attempting to pull the image. 
Thus, the pod will not be able to start and will remain in a pending state.

4. Get more insight into the problem
```
#??
```
In the Events section of the output for the affected Pods.
Notice that the v10 image version did not exist in the repository.

5. Now roll back the deployment to your last working version with the command ````rollout undo````
```
#??
```
The rollout undo command reverts the deployment to the previous known state (v2 of the image). 
Updates are versioned and can be reverted to any previously known state 
of a Deployment.

6. List the Pods again
```
#??
```
7. Check the image deployed on the running Pods
```
#??
```
The Deployment is once again using a stable version of the app (v2). The rollback was successful.
8. Clean up your local cluster
```
#??
```