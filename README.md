# Psiphond server

```
docker build -t psiphon-server .
docker run --rm -it psiphon-server:latest
```
Copy the token from the build output and use it for the client container https://github.com/AlexanderWiechert/psiphon-client

```
### Note client token ###
30203020302030207b22746167223a22222 ...
### Note client token ###
```
