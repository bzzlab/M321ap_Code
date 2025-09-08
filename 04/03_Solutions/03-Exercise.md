### Exercise 3: Launch Minikube dashboard
####  Pre requisit
1. You've successfully finished your previous exercise.
#### Tasks
Fill in the gaps to deploy at least four times the app ```google-samples/kubernetes-bootcamp:v1``` from
the registry ```gcr.io``` on K8s.

#### Your solution
1. Start your minikube dashboard on port 4000
```bash
minikube dashboard --port=4000 #??
```
2. Analyse your cluster-environment (Pods, Nodes ...)

3. Now remove all deployments
```bash
for pod in "${pods[@]}" #??
do #??
    kubeclt delete deployment ${pod} #?? 
done #??
```
4. Do you recognize the change in your cluster?
