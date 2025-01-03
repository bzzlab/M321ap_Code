### Exercise 1: Deploy an App
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)  
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ) 
#### Tasks
Fill in the gaps to deploy the app ```google-samples/kubernetes-bootcamp:v1``` from
the registry ```gcr.io``` on K8s.
#### Your solution
1. Create a cluster with minikube
```
minikube start #??
```
2. Deploy the mentioned app. Give it the name ```bzz-k8s-app-1```
```
kubectl create deployment bzz-k8s-app-1 --image=gcr.io/google-samples/kubernetes-bootcamp:v1 #??
```
3. Display the deployment
```
kubectl get deployments #??
```
4. View the app with ```kubectl proxy```. For that you need to open a second terminal window to run the proxy. Try now i.e. to query the version directly through the API with curl.
Background: The ```kubectl proxy``` command can create a proxy that will forward communications into the cluster-wide, private network. The proxy can be terminated by pressing control-C and won't show any output while it's running.
```
kubectl proxy --port=8001 #??
curl http://localhost:8001/version #??
```
5. Access the Pod through the proxied API. Get first the Pod name, and store it in the environment variable POD_NAME
```
export POD_NAME=$(\
 kubectl get pods #??\
 -o go-template --template \
 '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}') 
```
Background: The API server will automatically create an endpoint for each pod, based on the pod name, that is also accessible through the proxy.
7. Check the content of the POD_NAME
```
echo ${POD_NAME} #??
```
8. Access the Pod through the proxied API (http://localhost:8001/api/v1/namespaces/default/pods/<POD-NAME>:8080/proxy/) with curl.
```
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME:8080/proxy/ #??
```