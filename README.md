## LZ DEMO
### rev 20190305.1 [c3w@juicypop.net](mailto:c3w@juicypop.net)

for **CTO, LZ** c/o rp

--
I'd like to present a workflow, wherein `packer` is used to build a `docker image` with pre-run `ansible playbooks` with are then used as `k8s pod` within a `k8s cluster` with variances of stateful, stateless, persistent storage, and availability budgets

--
*the code so far. . .*

can be built in `vagrant`, `terraform`, and `k8s pod`.  what remains is to build a real environment that can live and exist on its own.  `k8s work starts here` and can be readied to spec with a day or too

--
**runtime**

   * cd ansible/ && packer build docker.json

or

   * cd vagrant/ && vagrant up --provision

**other code** (private repository)

   * packer build/tag AMIs with ansible for AWS

--
  
#TERRAFORM
    develop . deploy . configure
--
**usage:**

init, provision, run playbook and test, then destroy

```
./setup.sh
./provision.sh
./test.sh
```

```
./destroy.sh
```
--

**run playbook manually**

```
ansible-playbook --inventory-file=hosts.ini roles/site.yml
```

#PACKER
        develop . configure . deploy
        
* benefits

        reduced deploy times
            pre-builds from ansible
        eliminates software build network dependancy failures
        
    
--
* [https://kubernetes.io/docs/tasks/configure-pod-container/](https://kubernetes.io/docs/tasks/configure-pod-container/)
* [https://github.com/ansible/ansible-examples](https://github.com/ansible/ansible-examples)
* [https://github.com/terraform-providers/terraform-provider-aws](https://github.com/terraform-providers/terraform-provider-aws)

--
{end of line} -- c3w

