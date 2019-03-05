provider "aws" {
	region = "us-east-1"
}


resource "aws_key_pair" "auth" {
  key_name   = "terraform"
  public_key = "${file("/Users/c3w/.ssh/terraform.pub")}"
}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "default" {
  name        = "terraformz"
  description = "default terraform SG"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTPS access from the VPC
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port    = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "web" {
  ami = "ami-012fd5eb46f56731f"
  instance_type = "t1.micro"
  security_groups = ["terraformz"]
  key_name="terraform"



  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("/Users/c3w/.ssh/terraform")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install python2.7",
      "sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1"
    ]
  }
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
