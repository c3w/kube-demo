#!/bin/bash

if [ ! ${1} ]; then { echo "Usage: ./builddeploy.sh [version]"; exit 1; }; fi

#_VERSION="0.12"
_VERSION=${1}

cd _build
sed -e "s#_VERSION_#${_VERSION}#" packer_docker.json.skel > packer_docker.json
packer build packer_docker.json

cd ..

cd _deploy
sed -e "s#_VERSION_#${_VERSION}#" pod.yml.skel > pod.yml


kubectl apply -f pod.yml
kubectl expose -f pod.yml
#kubectl rollout status deployment/nginx-deployment
