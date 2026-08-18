# What are Minikube and Kubectl? 
Usually in a production cluster setup you will have
multiple master and worker nodes on separate machines.

But what if you want to test something on your local
machine or try something out? Setting up the whole cluster
would be difficult or even impossible. 🤨

For that use case you can use **minikube**: a ONE Node cluster,
where the master and worker processes are on the same machine.

**Kubectl**, the command line tool for Kubernetes, then
enables the interaction with the cluster: 
to create pods, services and other components.

In the below video I’ll explain everything in more detail with animations and show a demo of installing these components and start the minikube cluster.

## **Start Minikube**

If you want to run Kubernetes using Docker as the driver:

```bash
minikube start --driver=docker
```

Other drivers you can use: `virtualbox`, `qemu`, `kvm2`, `none` (bare-metal).

---

## **Verify**

```bash
kubectl get nodes
```

You should see:

```
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   1m    v1.xx.x
```

---

## **Basic Commands**

* To stop:

  ```bash
  minikube stop
  ```
* To delete cluster:

  ```bash
  minikube delete
  ```
* To enable dashboard:

  ```bash
  minikube dashboard
  ```
