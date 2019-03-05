#!/bin/bash

###
## install ansible-terraform provisioner

curl -sL \
  https://raw.githubusercontent.com/radekg/terraform-provisioner-ansible/master/bin/deploy-release.sh \
  --output /tmp/deploy-release.sh
chmod +x /tmp/deploy-release.sh
/tmp/deploy-release.sh -v 2.1.1
rm -rf /tmp/deploy-release.sh

###
## init terraform
terraform init

echo "*** NOW RUN ./provision.sh ***"
