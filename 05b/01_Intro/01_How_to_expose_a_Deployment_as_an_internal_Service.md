### How to expose a Deployment as a Service?

Let’s continue from your `hello-node` deployment (see 04/01_Intro/01_How_to_deploy_a_container_in_K8s.md). 
Right now you have a Pod that runs `agnhost netexec` listening on port **8080**, but it’s only accessible **inside the Pod**.
Here again the command for the deployment:
```
kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080
```
### ✅ Option 1: NodePort + `minikube ip`

This is the quickest:

1. Expose your deployment with NodePort:

   ```bash
   kubectl expose deployment hello-node \
     --name=hello-node-svc \
     --port=8080 \
     --target-port=8080 \
     --type=NodePort
   ```

2. Get the service details:

   ```bash
   kubectl get svc hello-node-svc
   ```

   Example:

   ```
   NAME             TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
   hello-node-svc   NodePort   10.99.39.188    <none>        8080:32045/TCP   10s
   ```

   → Here, **32045** is the NodePort.

3. Get your Minikube IP:

   ```bash
   minikube ip
   ```

   Example: `192.168.49.2`

4. Access it from your host:

   ```bash
   curl http://192.168.49.2:32045
   ```
   
### ✅ Option 2: LoadBalancer + `minikube tunnel` (cleaner URL)

1. Expose using LoadBalancer:

   ```bash
   kubectl expose deployment hello-node \
     --name=hello-node-svc \
     --port=8080 \
     --target-port=8080 \
     --type=LoadBalancer
   ```

2. Start the tunnel (needs a second terminal):

   ```bash
   minikube tunnel
   ```

   This gives your service an **external IP**.

3. Check the service:

   ```bash
   kubectl get svc hello-node-svc
   ```

   Example:

   ```
   NAME             TYPE           CLUSTER-IP      EXTERNAL-IP      PORT(S)          AGE
   hello-node-svc   LoadBalancer   10.96.97.119    127.0.0.1        8080:31850/TCP   1m
   ```

   → Now you can just do:

   ```bash
   curl http://127.0.0.1:8080
   ```
