# A Simple Hello World Python Demo 

This is a great first application to build. 

## Build the application

First build the Dockerfile by running the following command. Without building the container image first, the application will not be able to run. 

```
docker buildx build -t hello-world-python:latest -f Dockerfile .
```

## Run the application

After confirming that the hello-world-python:latest container image has been built, next you will need to run the container. Run the following command to confirm the image is present. 

```
docker images
```

To run the container, run the following command.

``` 
docker run -d -p 8080:8080 --name hello-world-python hello-world-python:latest
```

## Validate running application

Confirm the container is running with the following command.

```
docker ps
```

Your output should contain the following:

CONTAINER ID   IMAGE                       COMMAND            CREATED         STATUS         PORTS                                         NAMES
75dc927654cd   hello-world-python:latest   "python3 app.py"   4 seconds ago   Up 3 seconds   0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp   hello-world-python

To interact with the webserver, you will perform an HTTP GET request to see the output of the webserver.

```
curl http://localhost:8080
```

Your output should contain the following:


          ##         .
    ## ## ##        ==
 ## ## ## ## ##    ===
/"""""""""""""""""\___/ ===
{                       /  ===-
\______ O           __/
 \    \         __/
  \____\_______/


Hello from Docker!