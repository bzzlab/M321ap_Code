### How to test an exposed Service?
Let’s continue from your `hello-node-svc` service (see 05b/01_Intro/01_How_to_expose_a_Deployment_as_an_internal_Service.md).

The **`agnhost netexec`** server is a little Swiss-army knife for networking tests. 
Once you have exposed **`agnhost netexec`** server (via NodePort or LoadBalancer on Minikube), 
you can hit a bunch of HTTP endpoints.

Let’s assume your service is reachable at:

```
http://<EXTERNAL-IP>:8080
```

(replace `<EXTERNAL-IP>` with either `minikube ip:NodePort` or `127.0.0.1:8080` if you’re tunneling).

---

## 🔹 Basic endpoints to try

### 1. Health check

```sh
curl http://<EXTERNAL-IP>:8080/healthz
```

✅ Returns `200 OK` with a small response — good to check if the pod is alive.

---

### 2. Echo a string back

```sh
curl "http://<EXTERNAL-IP>:8080/echo?msg=hello-world"
```

✅ Responds with the string you sent.

---

### 3. Client info

```sh
curl http://<EXTERNAL-IP>:8080/clientip
```

✅ Shows the IP address the server sees for your request.

---

### 4. TCP connectivity test

You can ask `netexec` to connect back to another service/host:

```sh
curl "http://<EXTERNAL-IP>:8080/dial?host=google.com&port=80"
```

✅ Useful for checking if pods can reach external endpoints.

---

### 5. Environment variables (inside the container)

```sh
curl http://<EXTERNAL-IP>:8080/env
```

✅ Dumps all env variables inside the container.

---

### 6. File system listing

```sh
curl http://<EXTERNAL-IP>:8080/ls?path=/
```

✅ Lists files inside the container filesystem.

---

## 🔹 Bonus: Interactive testing

If you run this in a browser:

```
http://<EXTERNAL-IP>:8080/
```

You’ll actually see a simple HTML page with links to these endpoints.

---
