data "aws_availability_zones" "azs" {
}

resource "random_integer" "random" {
  max = 5
  min = 5
}

locals {
  azs = data.aws_availability_zones.azs.names
}

resource "aws_vpc" "ops" {
  cidr_block = var.vpc-cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "Ops VPC ${random_integer.random.id}"
  }
}

resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.ops.id
    cidr_block = cidrsubnet(var.vpc-cidr, 8, count.index)
    count = length(local.azs)
    availability_zone = local.azs[count.index]
}