variable "configuration" {
  default = {
    test = {
      region = "ap-southeast-1",
      size = "t2.nano"
    }
    staging = {
      region = "ap-southeast-2",
      size = "t2.micro"
    }
    production = {
      region = "ap-northeast-2",
      size = "t2.small"
    }
  }
}

variable "environment" {
    description="name of the enviroment"
}

variable "prefix" {
  description="prifix of EC2 instances"
}

