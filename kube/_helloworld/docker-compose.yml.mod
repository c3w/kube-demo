version: "2"

services:

    frontend:
      image: c3w/helloworld:0.1
      ports:
        - "8080:80"
      labels:
        kompose.service.type: LoadBalancer
