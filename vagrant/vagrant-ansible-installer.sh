#!/bin/bash -x

## vagrant-ansible installer
## rev 20190123c3w@juicypop.net

## to be run as a Vagrantfile shell provisioner
sudo apt-get -y install python2.7
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
