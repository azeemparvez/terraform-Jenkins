 variable "sg_name" {
    default = ""
    type = string
    description = "SG Name"
 }

 variable "ingress_from_port" {
   default = ""
   type = string
   description = "ingress from port"
 }

  variable "ingress_to_port" {
   default = ""
   type = string
   description = "ingress to port"
 }

 variable "vpc_id" {
   default = ""
   type = string
   description = "VPC ID"
 }

variable "ingress_cidr_blocks" {
    default = [""]
    type = list(string)
    description = "ingress CIDR"
  
}
