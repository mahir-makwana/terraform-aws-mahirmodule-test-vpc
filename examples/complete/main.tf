provider "aws" {
  region = "ap-south-1"
}
module "vpc" {
  source = "./module/VPC"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "my-test-vpc"
  }
  subnet_config = {

    public_subnets-1 = {
      cidr_block = "10.0.0.0/24"
      az         = "ap-south-1a"
      public     = true
    },
    public_subnets-2 = {
      cidr_block = "10.0.2.0/24"
      az         = "ap-south-1a"
      public     = true
    },
    private_subnets = {
      cidr_block = "10.0.1.0/24"
      az         = "ap-south-1b"
    }
  }
}

