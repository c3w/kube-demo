#!/bin/bash

if [ ! ${1}; ]; then { echo "Usage: ./benchmark.sh [pod] (use kubectl get pods for active)"; exit 1; }; fi

kubectl port-forward ${1} 8888:80
ab -n 1000 -c 10 http://localhost:8888/
