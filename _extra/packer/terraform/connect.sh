#!/bin/bash

IP=$(cat terraform.tfstate|grep "public_ip\":"|awk '{print $2}'|tr -d \",|tr -d ,)

ssh -i ~/.ssh/terraform ubuntu@${IP} ${1}
