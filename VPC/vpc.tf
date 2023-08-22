data "aws_availability_zones" "azs" {
}

resource "random_integer" "random" {
  max = 10000
  min = 1000
}

locals {
  azs = data.aws_availability_zones.azs.names
}

resource "aws_vpc" "ops" {
  cidr_block = var.vpc-cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "Ops VPC ${random_integer.random.result}"
  }
}

resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.ops.id
    cidr_block = cidrsubnet(var.vpc-cidr, 8, count.index)
    count = length(local.azs)
    availability_zone = local.azs[count.index]
    map_public_ip_on_launch = true
    tags = {
      Name = "Public Subnet ${count.index + 1} from OPS VPC${random_integer.random.result}"
    }
}

resource "aws_internet_gateway" "ops-igw" {
  vpc_id = aws_vpc.ops.id
}

resource "aws_route_table" "igw-rt" {
  vpc_id = aws_vpc.ops.id
  route {
    cidr_block = var.internet
    gateway_id = aws_internet_gateway.ops-igw.id
  }
}

resource "aws_route_table_association" "igw-a" {
    subnet_id = aws_subnet.public-subnet[count.index].id
    count = length(local.azs)
    route_table_id = aws_route_table.igw-rt.id
}



