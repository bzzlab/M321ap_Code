### Steps for Demo-01 in your AWS EC2 instance with single commands
1. Touch and edit 'Dockerfile1'
```touch Dockerfile1```
2. Edit 'Dockerfile1' based on its comments
```nano Dockerfile1```
3. Build a dockerfile with tag -t
```docker build -t m347_i1 -f Dockerfile1 .```
4. List images
```docker image ls```
5. Run container
```docker run -itd --rm --name m347_c1 m347_i1```
4. Access container via bash
```docker exec -it m347_c1 bash```

