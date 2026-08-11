### Exercise 3: Load Balancing the traffic
####  Pre requisit
1. AWS EC2 instance is started based on the shared AMI of your educator (https://youtu.be/-R7qjgfMgtI)  
2. You can connect via SSH to your started instance (https://youtu.be/mH3UMAV5TNQ)
3. Previous exercise is running successfully.
#### Tasks
Check that the Service is load-balancing the traffic.
#### Your solution
1. Determine the exposed IP and Port of the exposed service of ```bzz-app-3``` 
```
#??
```
2. Create an environment variable called NODE_PORT that has a value as the Node port
```
#??
#??
#??
#??
```
3. Execute curl to the exposed IP address and port multiple times
```
#??
```
You should observe that the response comes from a different Pod with every request. 
This demonstrates that the load-balancing is working.