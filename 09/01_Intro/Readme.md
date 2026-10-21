# Minikube self-healing demo
Involved artifacts are Python app + Dockerfile + K8s Deployment

## Test the shutdown / self-heal behaviour
In Moodle you received the relevant background information on the relevant components
of K8s and its 'self-healing' mechanism. 

This document gives you a short introduction on how to test and experience this 
mechanism in a context of a lab. Read explicitly the instructions of each exercise (```09/02_Exercises/01/Exercise.md to /02/Exercise.md```).

After running the application in your minikube, follow these instructions:

1. See current pod name:

```bash
kubectl get pods
```

2. Trigger the shutdown by curling the service's `shutdown` endpoint (via port-forward or minikube service URL):

```bash
curl http://127.0.0.1:<port>/shutdown
```
Remark: <port> is defined in your app.

What happens:

* The app sets `is_ready = False`. The readiness probe will then start failing and Kubernetes removes the pod from Service endpoints.
* The `stop_event` causes the server to stop accepting new requests and eventually shut down its HTTP server.
* If the container process exits, kubelet may restart it (container-level restart) or, if the Pod object was deleted, the ReplicaSet will create a new Pod.
* Watch `kubectl get pods -w` to observe the pod terminating and a replacement coming up — demonstrating self-healing.

## Useful kubectl commands for debugging

```bash
kubectl describe pod <pod-name>
kubectl logs <pod-name>
kubectl logs <pod-name> --previous
kubectl get endpoints my-python-service
kubectl get endpointslices
```

---

## Notes & best practices

* **PreStop**: in this example `preStop` uses `curl` inside the container to call the app's `/shutdown` endpoint. `preStop` runs before SIGTERM, letting your app mark itself NotReady and start graceful shutdown.
* **Readiness probe**: ensures traffic is removed from the Pod before termination. Always use readiness for graceful shutdown.
* **TerminationGracePeriodSeconds**: increase if your app needs more time to finish in-flight requests.
* **Do not expose `/shutdown` publicly** unless protected
