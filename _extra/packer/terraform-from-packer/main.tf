provider "aws" {
	region = "us-east-1"
}

data "aws_ami" "packer" {
  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "tag:Name"
    values = ["truckingoffice"]
  }
  most_recent = true
}



resource "aws_key_pair" "auth" {
  key_name   = "terraformx3"
  public_key = "${file("/Users/c3w/.ssh/terraform.pub")}"
}

resource "aws_instance" "web" {
  ami = "${data.aws_ami.packer.id}"
  instance_type = "t1.micro"
  security_groups = ["default"]
  key_name="terraformx3"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("/Users/c3w/.ssh/terraform")}"
  }

#  provisioner "remote-exec" {
#    inline = [
#      "sudo apt-get -y update",
#      "sudo apt-get -y install python2.7",
#      "sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1"
#    ]
#  }
#  provisioner "ansible" {
#    plays {
#      playbook = {
#        file_path = "../../ansible/roles/playbook.yml"
#        roles_path = ["../../ansible/roles"]
#     }
#      enabled = true
#      hosts = ["web"]
#       become = true
#       become_method = "sudo"
#       become_user = "root"
#   }
#}
}
