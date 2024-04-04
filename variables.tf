# prj
variable "project_name" {} 
variable "environment" {}

# network
variable "cidr_vpc" {}
variable "cidr_public1" {}
variable "cidr_public2" {}
variable "cidr_private1" {}
variable "cidr_private2" {}

# Bastion
variable "bastion_ami" {}
variable "bastion_instance_type" {}
variable "bastion_key_name" {}
variable "bastion_volume_size" {}
