## How to deploy agnhost container?

### 1. Example
Let's take a special container with built-in subcommands:
```
kubectl create deployment hello-node --image:registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080
```
### 2. Command structure

* **`kubectl create deployment hello-node`**
  → Creates a Deployment resource named **`hello-node`** in your Kubernetes cluster.

* **`--image=registry.k8s.io/e2e-test-images/agnhost:2.39`**
  → Specifies the container image to run in the Pod(s).

  * `agnhost` is a special test image from Kubernetes with multiple built-in subcommands (like `netexec`, `pause`, `dnsutils`, etc.).
  * Version/tag is `2.39`.

* **`-- /agnhost netexec --http-port=8080`**
  → Everything **after `--`** is passed as the **command + arguments inside the container** (instead of using the image’s default entrypoint).

  * `/agnhost` → binary inside the container.
  * `netexec` → a utility mode of `agnhost` that runs a small HTTP server and supports various networking operations.
  * `--http-port=8080` → makes it listen on port **8080**.

---

### 3. What does this do in practice?

This command:

* Creates a Deployment named **`hello-node`**.
* Each Pod runs a container from `registry.k8s.io/e2e-test-images/agnhost:2.39`.
* Instead of the default entrypoint, it starts the `agnhost netexec` server.
* That server listens on port **8080** and can be used for networking tests (e.g., connectivity, DNS, HTTP probing).


---
