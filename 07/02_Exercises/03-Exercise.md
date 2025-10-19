### Exercise 3: Verify an update
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)  
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ)
3. Previous exercise is running successfully.
#### Tasks
Verify that the app has been correctly updated with expected version.
#### Your solution
1. Expose the Deployment by type "NodePort" on Port 8080, if not already done.
```
#??
```
2. Create an environment variable called NODE_PORT that has the value of the Node port assigned.
```
#??
#??
#??
#??
```
3. Curl to the exposed IP and port:
```
#??
```
Every time you run the curl command, you will hit a different Pod. 
Notice that all Pods are now running the latest version (v2).
4. Confirm the update with command ```rollout status```
```
#??
```
5. View the current image version of the app
```
#??
```
In the Image field of the output, verify that you are running the latest image version (v2).
