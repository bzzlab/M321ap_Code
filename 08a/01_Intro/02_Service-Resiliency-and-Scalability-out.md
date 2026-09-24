# Service Resiliency and Scalability
Kubernetes Pods are neither resilient nor scalable. 

| <img src="img/02b_1_Pod-Limitations.png" width="500"/> |
|:------------------------------------------------------:|
|                *Fig-1: Pod-Limitations*                |

High-level controllers like ReplicaSets offers solutions for this.

| <img src="img/02b_2_High-Level-controller.png" width="500"/> |
|:------------------------------------------------------------:|
|                *Fig-2: High-Level-controller*                |


| <img src="img/02b_5_replicaset.png" width="500"/> |
|:-------------------------------------------------:|
|                *Fig-3: replicaset*                |


| <img src="img/02b_6_deployment.png" width="500"/> |
|:-------------------------------------------------:|
|                *Fig-4: deployment*                |


| <img src="img/02b_7_statefulset.png" width="500"/> |
|:--------------------------------------------------:|
|                *Fig-5: StatefulSet*                |

### In Production: Rule of thumb
Do not manually create a Pod. Instead,
rely on controllers (ReplicaSet, Deployment, StatefulSet)


