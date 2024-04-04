# prj
variable "project_name" { default = "test" } 
variable "environment" { default = "dev" }
variable "key_name" { default = "" }

# VPC
variable "cidr_vpc"        { default = "10.0.0.0/16"}
variable "cidr_public1"    { default = "10.0.0.0/24" }
variable "cidr_public2"    { default = "10.0.1.0/24" }
variable "cidr_private1"   { default = "10.0.11.0/24" }
variable "cidr_private2"   { default = "10.0.12.0/24" }

# Bastion
variable "bastion_ami"           { default = "ami-0a93a08544874b3b7" }
variable "bastion_instance_type" { default = "t3.micro" }
variable "bastion_key_name"      { default = "devops" }
variable "bastion_volume_size"   { default = 8 }
