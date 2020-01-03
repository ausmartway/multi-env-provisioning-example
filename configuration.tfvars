variable "configuration" {
  default = {
    test = {
      region = "ap-southeast-1",
      size = "a1.medium"
    }
    staging = {
      region = "ap-southeast-2",
      size = "a1.large"
    }
    production = {
      region = "ap-northeast-2",
      size = "a1.xlarge"
    }
  }
}
