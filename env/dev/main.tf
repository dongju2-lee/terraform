terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "dev" {
  source = "../../"

  # prj
  project_name = var.project_name
  environment = var.environment

  # VPC
  cidr_vpc = var.cidr_vpc
  cidr_public1 = var.cidr_public1
  cidr_public2 = var.cidr_public2
  cidr_private1 = var.cidr_private1
  cidr_private2 = var.cidr_private2

  # Public EC2
  bastion_ami           = var.bastion_ami
  bastion_instance_type = var.bastion_instance_type
  bastion_key_name      = var.bastion_key_name
  bastion_volume_size   = var.bastion_volume_size

}