###zer0 downtime autoscaler with deployment

--

**build with terraform and deploy on k8s**

`./builddeploy.sh 0.1`

```
==> Builds finished. The artifacts of successful builds are:
--> docker: Imported Docker image: sha256:7bdb09b5423b79ea858b4c075498315d789716d560eb7aa13f0088d1c2600d1a
--> docker: Imported Docker image: c3w/nginx-helloworld:0.1
```

--

**show replicas and utilization**

`kubectl get hpa`

```
NAME                   REFERENCE                         TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
nginx-helloworld-hpa   Deployment/nginx-deployment       0%/50%    3         10        3          33m
```

--
**verify autoscaler with benchmark**
`kubectl run -it --rm --restart=Never benchmark --image=c3w/nginx-helloworld:0.11 /bin/bash`

**inside container**
`ab -c 100 -n 10000000 http://nginx-deployment/`

**back to host to check hpa**

`kubectl get hpa`

```
NAME                   REFERENCE                     TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
nginx-helloworld-hpa   Deployment/nginx-deployment   92%/50%   3         10        5          48m
```

. . . and it takes several minutes to scale back to minimum.

```
Concurrency Level:      100
Time taken for tests:   35.444 seconds
Complete requests:      152948
**Failed requests:        0
Total transferred:      98201604 bytes
HTML transferred:       61184800 bytes
Requests per second:    4315.19 [#/sec] (mean)
Time per request:       23.174 [ms] (mean)
Time per request:       0.232 [ms] (mean, across all concurrent requests)
Transfer rate:          2705.67 [Kbytes/sec] received
```

--

further benchmarking should be done with load-bearing links, which requires a pod of nginx + modules (php, uwcgi, etc)

{eof}
