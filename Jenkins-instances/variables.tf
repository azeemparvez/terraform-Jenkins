variable "instance_type" {
    default = ""
    type = string
    description = "Instance Type"
}

variable "subnet_id" {
    default = ""
    type = string
    description = "Instance Type"
}

variable "key_name" {
  default = "azeem"
  type = string
  description = "AWS SSH key to be used for AWS instances"
}