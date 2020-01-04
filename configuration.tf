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
      size = "t2.large"
    }
  }
}

variable "environment" {
    description="name of the enviroment"
    default="test"
}

