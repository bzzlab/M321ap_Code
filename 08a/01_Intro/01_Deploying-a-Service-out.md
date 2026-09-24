# Recapture basics of Kubernetes (K8s)

### Purpose of Pod?
| <img src="img/01a_Pods-Basic-K8s-Unit.png" width="500"/> |
|:--------------------------------------------------------:|
|            *Fig-0: Pod as basic unit of K8s*             |

### Purpose of a Node?
| <img src="img/01b_What-is-a-Node.png" width="500"/> |
|:--:|
| *Fig-1: What-is-a-Node* |

### Purpose of a Namespace?

| <img src="img/01c_Namespace.png" width="500"/> |
|:--:|
| *Fig-2: Namespace* |

### Example of Pod as YAML Definition

| <img src="img/01d_Pod-Example.png" width="500"/> |
|:--:|
| *Fig-3: Pod-Example* |


| <img src="img/01e_Pod-Example.png" width="500"/> |
|:--:|
| *Fig-4: Pod-Example* |

### Commands for Pods
````
kubctl apply -f pod.yaml 
kubctl get pods
````

### Open Question
How do I connect to a pod from outside the cluster?

With a __Service__! 

| <img src="img/01g_Pod-Open-Issues.png" width="500"/> |
|:----------------------------------------------------:|
|       *Fig-6: Connecting to a Pod via Service*       |

