terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  region  = "${lookup(var.configuration, var.environment).region}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami               = "${data.aws_ami.ubuntu.id}"
  instance_type     = "${lookup(var.configuration, var.environment).size}"
  availability_zone = "${lookup(var.configuration, var.environment).region}a"

  tags = {
    Name= "${var.prefix}-multiple-env-demo"
    TTL           = 2
    Owner         = "Yulei"
    instance_type = "${lookup(var.configuration, var.environment).size}"
  }
}
