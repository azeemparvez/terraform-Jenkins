module "vpc" {
  source = "./VPC"
  vpc-cidr = var.vpc-cidr
}
module "jenkins-instance" {
  source = "./Jenkins-instances"
  instance_type = var.instance_type
  subnet_id = module.vpc.public-subnets[0]
  key_name = "azeem"
  }

module "jenkins-slaves" {
  source = "./Jenkins-instances"
  instance_type = var.instance_type
  subnet_id = module.vpc.public-subnets[1]
  key_name = "azeem"
  }


