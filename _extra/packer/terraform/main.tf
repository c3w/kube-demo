provider "aws" {
	region = "us-east-1"
}

resource "aws_key_pair" "auth" {
  key_name   = "packer-terraform"
  public_key = "${file("/Users/c3w/.ssh/terraform.pub")}"
}

resource "aws_instance" "web" {
  ami = "ami-012fd5eb46f56731f"
  instance_type = "t1.micro"
  security_groups = ["default"]
  key_name="packer-terraform"

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
  #provisioner "ansible" {
  #  plays {
  #    playbook = {
  #      file_path = "roles/playbook.yml"
  #      roles_path = ["roles"]
  #   }
  #    enabled = true
  #    hosts = ["web"]
  #     become = true
   #     become_method = "sudo"
  #     become_user = "root"
  # }
#}
}
