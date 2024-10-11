# terraform-aws-vpc

## Overview

This Terraform module creates an AWS VPC with a given CIDR block. It also creates multiple subnets(public and private),
and for public subnets, it sets up an Internet Gateway (IGW) and appropriate route tables.

## Features

- Creates a VPC with a specified CIDR block
- Creates public and private subnets
- Creates an INternet Gateway (IGW) for public subnets
- Sets up route tables for public subnets

## USage

```
  module "vpc" {
  source = "./module/VPC"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your_vpc_name"
  }
  subnet_config = {

    public_subnets = {
      cidr_block = "10.0.0.0/24"
      az         = "ap-south-1a"
      #To set the subnets as public , default is private
      public     = true
    },
    private_subnets = {
      cidr_block = "10.0.1.0/24"
      az         = "ap-south-1b"
    }
  }
}

```
