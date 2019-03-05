#!/bin/bash

IP=$(cat terraform.tfstate|grep "public_ip\":"|awk '{print $2}'|tr -d \",|tr -d ,)

ssh -i ../../terraform/offline/user-ssh-keys/ubuntu ubuntu@${IP} ${1}
