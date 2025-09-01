### Exercise 2: Deploy more Apps and remove them
####  Pre requisit
1. You've successfully finished your previous exercise.
#### Tasks
Fill in the gaps to deploy at least four times the app ```google-samples/kubernetes-bootcamp:v1``` from
the registry ```gcr.io``` on K8s.

#### Your solution
1. Check cluster status with minikube and restart it if the cluster is stopped.
```bash
#??
```
2. Deploy at least three times mentioned app and using this time the port flag (see help for that). Give it the name ```app-1``` to ```app-4```.
```bash
#??
#??
#??
#??
#??
```
3. Display the deployment
```bash
#??
```
4. Access the Pod through the proxied API. Get first the Pod name, and store it in the environment variable POD_NAME
```bash
declare -a pods=($(kubectl get pods --no-headers -o custom-columns=":metadata.name"))
```
Background: The API server will automatically create an endpoint for each pod, based on the pod name, that is also accessible through the proxy.
5. Check the assigned pod names (i.e. as loop)
```bash
# Looping through pods-Array
#??
#??
#??
#??
```
or 
```bash
# Write the output with by using the pods-Array index
#??
```

6. Open a Bash-shell to that running Pod, with a command like
kubectl exec <POD-Name> -it -- bash
```bash
#??
```
and examine the code server.js

7. View the app with ```kubectl proxy``` and Port 8001. For that you need to open a second terminal window to run the proxy. Try now i.e. to query the version directly through the API with curl.
```bash
#??
#??
```

8. Access the Pod through the proxied API (http://localhost:<PORT>/api/v1/namespaces/default/pods/<POD-NAME>:8080/proxy/) with curl.
```bash
#??
#??
#??
#??
```

9. Now remove all deployments
```bash
#??
#??
#??
#??
```