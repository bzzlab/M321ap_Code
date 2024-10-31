### Exercise 3: Label and select your app
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)  
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ)
3. Previous exercise has been solved successfully.
#### Tasks
Label and select your app by assigning custom labels.
#### Your solution
1. Check the automatically created label by the Deployment for our Pod.
```
kubectl describe deployment #??
```
2. Query the list of Pods by using the label ```app```:
```
kubectl get pods -l app=bzz-app-2 #??
```
3. Query the list of existing Services in the same way:
```
kubectl get services -l app=bzz-app-2 #??
```
4. Store the Pod in the PODNAME environment variable:
```
export PODNAME=\  #??
    "$(kubectl get pods \  #??
    -o go-template \  #??
    --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')"  #??
echo "Name of the Pod: $PODNAME"  #??
```
5. Apply a new label 'ver=1.0' to the Pod and check it if it was correctly assigned:
```
kubectl label pods "$PODNAME" ver=1.0  #??
kubectl describe pods "$PODNAME"  #??
```
6. Query now the list of pods using the new label version
```
kubectl get pods -l ver=1.0  #??
```
7. Delete and check that the label has been removed
```
kubectl label pods "$PODNAME" ver- #??
kubectl describe pods "$PODNAME"  #??
```

