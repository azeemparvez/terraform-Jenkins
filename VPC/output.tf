output "public-subnets" {
    value = aws_subnet.public-subnet[*].id
}

output "vpc_id" {
  value = aws_vpc.ops.id
}