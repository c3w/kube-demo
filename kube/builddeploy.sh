#!/bin/bash

_VERSION="0.11"

cd _build
sed -e "s#_VERSION_#${_VERSION}#" packer_docker.json.skel > packer_docker.json
packer build packer_docker.json

cd ..

cd _deploy
sed -e "s#_VERSION_#${_VERSION}#" pod.yml.skel > pod.yml

kubectl apply -f pod.yml
