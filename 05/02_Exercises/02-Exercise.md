### Exercise 2: Expose your app
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)  
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ)
3. Previous exercise is running successfully.
#### Tasks
Expose your app by creating a K8s service.
#### Your solution
1. Verify that your application ```bzz-app-2``` is running
by displaying the Pods.
```
#??
```
Remark: If no Pods are running then it means the objects from the previous exercise has been cleaned up
or does not working successfully. In this case, go back and recreate/troubleshoot the deployment.  
2. Create a new service on port 8080 as NodePort type and expose it to external traffic:
```
#??
```
3. List the current Services from your cluster
```
#??
```
You should see a running Service called ```bzz-app-2```. Here we see that the Service received a unique cluster-IP,
and an internal port.
4. Find out what port was opened externally for the app 
```
#??
```
5. Create an environment variable called NPORT that has the value of the 
Node port assigned. Write it afterward on the terminal.
```
#??
#??
#??
#??
```
6. Test that the app is exposed outside of the cluster using curl, the IP address of the 
Node and the externally exposed port:
```
#??
```