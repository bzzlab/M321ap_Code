### Exercise 4: Deleting a service
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)  
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ)
3. Previous exercise has been solved successfully.
#### Tasks
Delete your existing K8s services by using labels
#### Your solution
1. Revise assigned labels
```
kubectl get pods #??
kubectl describe pods "$PODNAME" #??
```
2. Delete your service by using an existing label
```
kubectl delete service -l app=bzz-app-2 #??
```
3. Check that the Service is gone:
```
kubectl get services #??
```
4. Confirm that the route is not exposed anymore. Hint: Use curl
```
curl http://"$(minikube ip):$NPORT" #??
```
5. Check if the app is still running with a curl from inside the pod:
```
kubectl exec -ti $PODNAME -- curl http://localhost:8080 #??
```
The application should be up and running. 
6. What should do to shut down the application? 
Explain what would you do in short sentence.
You need to delete the Deployment as well. #??

