### Exercise 3: Run a static website in a container
####  Pre requisit
Docker container environment (i.e. actual version of Docker-Desktop) is mandatory.
#### Tasks
1. Program the Dockerfile ```WebDockerfile``` by filling required the gaps. For an
example see [DockerFile Nginx](https://medium.com/@mrdevsecops/dockerfile-nginx-842ba0a55b82)
2. Fill the gaps in web.conf where its variable are used in the subsequent bash-scripts.
3. Program ```setup.sh``` that builds and runs a static website based on a
container with nginx as web server. ```curl``` is used for testing the 
website (submit an HTTP-GET request).
4. Program ```teardown.sh``` in order to remove container and image. 
5. In case of errors: 
   - Analyze the error message
   - Figure out the cause of the error and test an initial workaround (troubleshooting).