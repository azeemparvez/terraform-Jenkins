variable "instance_type" {
  default = ""
  type = string
  description = "instance type for instances "
}

variable "vpc-cidr" {
  default = ""
  type = string
  description = "VPC CIDR Block details"
}