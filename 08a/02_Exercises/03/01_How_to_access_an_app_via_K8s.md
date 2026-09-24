## How to access an app via K8
### Steps
1. Create and apply (```kubectl apply -f <yaml-file>```) a deployment
Example: deployment.yaml
````
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo-deploy
  labels:
    app: demo-deploy
spec:
 ....
````
2. Create and apply a service
Example: service.yaml
````
apiVersion: v1
kind: Service
metadata:
  name: demo-service
spec:
  ...
````
3. Fetch URL to access app ````minikube service <service-name> --url````
In our example:
````
minikube service demo-service --url
````
Possible output
````
http://192.168.49.2:30549
````
4. Access app with curl 
Example:
````
curl http://192.168.49.2:30549
````
