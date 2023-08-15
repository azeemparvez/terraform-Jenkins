module "vpc" {
  source   = "./VPC"
  vpc-cidr = var.vpc-cidr
}

module "sg-ssh" {
  source = "./securitygroups"
  sg_name = "SSH"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_from_port = 22
  ingress_to_port = 22
}

module "sg-web" {
  source = "./securitygroups"
  sg_name = "HTTP"
  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_from_port = 8080
  ingress_to_port = 8080
}

module "jenkins-instance" {
  source        = "./Jenkins-instances"
  instance_name = "Jenkins-Master"
  instance_type = var.instance_type
  subnet_id     = module.vpc.public-subnets[0]
  security_groups = [ module.sg-ssh.security_groups, module.sg-web.security_groups ]
  key_name      = "azeem"
}

module "jenkins-slaves" {
  source        = "./Jenkins-instances"
  instance_name = "Jenkins-Slave"
  instance_type = var.instance_type
  subnet_id     = module.vpc.public-subnets[1]
  security_groups = [ module.sg-ssh.security_groups ]
  key_name      = "azeem"
}


