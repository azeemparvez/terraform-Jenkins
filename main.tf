module "vpc" {
  source = "./VPC"
  vpc-cidr = "10.0.0.0/16"
}
module "jenkins-instance" {
  source = "./Jenkins-instances"
  instance_type = "t2.micro"
  subnet_id = module.vpc.public-subnets[0]
  key_name = "azeem"
  }
