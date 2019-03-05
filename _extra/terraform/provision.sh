#!/bin/bash
terraform apply -var 'key_name=terraform' \
   -var 'public_key_path=offline/terraform-keys/terraform.pub'

export IP="$(cat terraform.tfstate|grep "public_ip\":"|awk '{print $2}'|tr -d \",|tr -d ,)"
     sed -e "s/%%PUBLIC_IP%%/$IP/" hosts.ini.skel > hosts.ini
     ansible-playbook --inventory-file=hosts.ini ../ansible/roles/playbook.yml
