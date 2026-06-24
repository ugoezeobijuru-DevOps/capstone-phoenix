terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source      = "./modules/network"
  project     = var.project
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  aws_region  = var.aws_region
}

module "security_group" {
  source   = "./modules/security_group"
  project  = var.project
  vpc_id   = module.network.vpc_id
  vpc_cidr = var.vpc_cidr
  my_ip    = var.my_ip
}

module "compute" {
  source        = "./modules/compute"
  project       = var.project
  instance_type = var.instance_type
  subnet_id     = module.network.subnet_id
  sg_id         = module.security_group.sg_id
  key_name      = var.key_name
  worker_count  = var.worker_count
}
