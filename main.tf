terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = ">= 3.0"
  }
  
}

provider "aws" {
  region  = lookup(var.configuration, var.environment).region
  // region  = "${lookup(var.configuration, var.environment).region}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu-minimal/images/hvm-ssd/ubuntu-jammy-22.04-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

#  resource "aws_instance" "ubuntu" {
#    ami               = data.aws_ami.ubuntu.id
#    instance_type     = lookup(var.configuration, var.environment).size
#    availability_zone = "${lookup(var.configuration, var.environment).region}a"
#    tags = {
#      Name= "${var.prefix}-multiple-env-demo-${var.environment}"
#      TTL           = 1
#      Owner         = "yulei@hashicorp.com"
#      Region        = "APJ-ANZ"
#      Purpose       = "demo"
#      Terraform     = "true"
#      TFE           = "true"
#      instance_type = lookup(var.configuration, var.environment).size
#    }
#  }
