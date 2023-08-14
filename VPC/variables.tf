variable "vpc-cidr" {
  default = ""
  type = string
  description = "CIDR Block for VPC"
}

variable "internet" {
  default = "0.0.0.0/0"
  type = string
  description = "CIDR Block for VPC"
}

