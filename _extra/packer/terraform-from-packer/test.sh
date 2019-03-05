#!/bin/bash

IP=$(cat terraform.tfstate|grep "public_ip\":"|awk '{print $2}'|tr -d \",|tr -d ,)

### tests http, https, then logs in as ubuntu
echo "Press a key for HTTP test"; read
echo HTTP
echo
curl http://${IP}

echo "Press a key for HTTPS test"; read
echo HTTPS
echo
curl --insecure http://${IP}

echo "Press a key to ssh into aws as ubuntu"; read
echo SSH
ssh -i ../../terraform/offline/user-ssh-keys/ubuntu ubuntu@${IP}
