#VPC
output "vpc_id" {
  value = aws_vpc.main.id
}

locals {
  #To format the subnet IDs which may be multiple inm format of subnet_name = {id=,az=}
  public_subnets_output = {
    for key, config in local.public_subnets : key => {
      subnet_id = aws_subnet.main[key].id
      az        = aws_subnet.main[key].availability_zone
    }
  }

  private_subnets_output = {
    for key, config in local.private_subnets : key => {
      subnet_id = aws_subnet.main[key].id
      az        = aws_subnet.main[key].availability_zone
    }
  }
}
#Subnets Details
output "public_subnets" {
  value = local.public_subnets_output
}

output "private_subnets" {
  value = local.private_subnets_output
}
