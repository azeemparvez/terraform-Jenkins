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

variable "security_groups" {
  default = []
  type = list(string)
  description = "security group IDs"
}

variable "instance_name" {
  default = ""
  type = string
  description = "Instance Name"
  
}

variable "ansiblefile" {
  default = ""
  type = string
  description = "File for ansible automation"
  
}