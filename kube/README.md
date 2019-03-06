# match versions

###
## builds k8s-docker image with ansible/packer
packer build packer_docker.json 
##? tag latest

## deploy
kubectl create -f pod.xml
kubectl expose -f pod.xml

## iterate and deploy change?
## use throwaway api

## benchmark


## misc
#kubectl run -it --rm --restart=Never benchmark --image=c3w/nginx-helloworld:latest /bin/bash
kubectl run -it --rm --restart=Never benchmark2 --image=c3w/nginx-helloworld:0.4 /bin/bash
