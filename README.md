## KUBE-DEMO
### rev 20190306.1

#TERRAFORM
    develop . deploy . configure
--

**k8s autoscale + zero(0) downtime rollout**

--
In this workflow, we use `packer` to build a `docker image` with pre-run `ansible playbooks` which are used as `k8s pod` within a `k8s cluster` in the following configuration

   * ingress
   * autoscaler (min: 3, max: 10, cpu: 50%)
   * deployment used by autoscaler
     * with readinessProbe to (path: :80/)
 
--
**build and deploy to k8s**

   `cd kube/ && ./builddeploy.sh [version]` (e.g. 0.1)

**load benchmark**

   `kubectl run -it --rm --restart=Never benchmark6 --image=c3w/nginx-helloworld:0.11 /bin/bash`

   `ab -c 100 -n 1000000 http://nginx-deployment`

--

#please see [kube/README.md](kube/README.md) for operations

--

**optional local testing of app on desktop**

   `cd vagrant/ && vagrant up --provision`

--
* [https://kubernetes.io/docs/tasks/configure-pod-container/](https://kubernetes.io/docs/tasks/configure-pod-container/)
* [https://github.com/ansible/ansible-examples](https://github.com/ansible/ansible-examples)
* [https://github.com/terraform-providers/terraform-provider-aws](https://github.com/terraform-providers/terraform-provider-aws)

--
{end of line} -- c3w

