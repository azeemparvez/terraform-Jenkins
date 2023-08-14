terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.12.0"
    }
  }
    backend "s3" {
    bucket = "terraform-hipertest"
    key    = "config-folder/jenkins.tfstate"
    region = "eu-west-2"
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  # Configuration options
}

module "vpc" {
  source = "./VPC"
  vpc-cidr = "10.0.0.0/16"
}