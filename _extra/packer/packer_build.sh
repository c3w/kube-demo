#!/bin/sh

###
## packer AMI build
## provisions terraform network
## ru

export BASE_AMI="ami-012fd5eb46f56731f"
export AMI_TAG="truckingoffice"
#export SUBNET_ID="subnet-0a45ce4362f5ef13d"

#function provTF() {
#  pushd ../terraform
#  ./setup.sh
#  time ./provision.sh
#  popd
#  echo "build time: $(./connect.sh uptime|awk '{print $3,$4}'|tr -d ,)"
#}

#provTF
## fix hardcoded vpc/subnets/manual creation/destroy?
sed -e "s/%%BASE_AMI%%/${BASE_AMI}/g;s/%%AMI_TAG%%/${AMI_TAG}/g" packer_build.json.skel \
  > terraform/packer_build.json
sed -e "s/%%BASE_AMI%%/${BASE_AMI}/g;s/%%AMI_TAG%%/${AMI_TAG}/g" packer_find.json.skel \
  > terraform/packer_find.json

##sed -e "s/%%BASE_AMI%%/${BASE_AMI}/g;s/%%AMI_TAG%%/${AMI_TAG}/g" packer_deploy_from_buildAMI.tf.skel \
#  > terraform/packer_deploy_from_buildAMI.tf

cd terraform && terraform init
terraform plan -out out.terraform
terraform apply out.terraform
rm out.terraform
packer build packer_build.json
#terraform destroy

#?what is packer ami?
export AMI_PACKER=""

sed -e "s/%%AMI_PACKER%%/${BASE_AMI}/g;s/%%AMI_TAG%%/${AMI_TAG}/g" main.tf.packer.skel \
  > terraform-from-packer/main.tf

cd terraform-from-packer
