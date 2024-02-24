Follow the below instructions to run the Dockerfile

To build the image 
 ```
 docker build -t imagename .
 ```
Command to run the container 
```
docker run -itd --name imagename
```
Command to interact with the container using bash 
```
docker exec -it containerID bash
```
