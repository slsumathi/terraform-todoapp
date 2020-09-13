provider "aws" {
  region = "ap-south-1"
}

# terraform {
#   backend "s3" {
#     bucket = "todoapp-terraform-state-bucket-s3"
#     key    = "terraform-tfstate"
#     region = "ap-south-1"
#     acl    = "bucket-owner-full-control"
#   }
# }

module "s3" {
    source  = "../modules/s3"
    todoapp_ui_path = "../ui/"
    s3_ui_bucket_name = "todoapp-react-ui-code"
}

module "vpc" {
  source  = "../modules/vpc"
  vpc_cidr = "10.20.0.0/16"
  vpc_name = "todoapp-vpc-dev"
}

module "public-subnets" {
  source  = "../modules/public-subnets"
  public_subnet_cidr = "10.20.0.0/16"
  vpc_id = module.vpc.vpc_id
}

module "private-subnets" {
  source  = "../modules/private-subnets"
  region = "ap-south-1"
  az_names = module.public-subnets.az_names
  az_count = module.public-subnets.az_count
  public_subnet_cidr = module.public-subnets.public_subnet_cidr
  vpc_id = module.vpc.vpc_id
}

module "sgs" {
  source  = "../modules/sgs"
  vpc_id = module.vpc.vpc_id
}

module "nat" {
  source = "../modules/nat"
  ec2_instance_type = "t2.micro"
  region = "ap-south-1"
  vpc_id = module.vpc.vpc_id
  nat_security_grp_id = module.sgs.nat_security_grp_id
  public_subnet_ids = module.public-subnets.public_subnet_ids
  private_subnet_ids = module.private-subnets.private_subnet_ids
  public_subnet_cidr = module.public-subnets.public_subnet_cidr
}

module "rds" {
  source  = "../modules/rds"
  private_subnet_ids = module.private-subnets.private_subnet_ids
  rds_security_grp_id = module.sgs.rds_security_grp_id
}

module "igw" {
  source  = "../modules/igw"
  az_count = module.public-subnets.az_count
  public_subnet_ids = module.public-subnets.public_subnet_ids
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source  = "../modules/ec2"
  ec2_count = "2" 
  public_subnet_ids = module.public-subnets.public_subnet_ids
  ec2_security_grp_id = module.sgs.ec2_security_grp_id
  elb_security_grp_id = module.sgs.elb_security_grp_id
}

module "elb" {
  source  = "../modules/elb"
  public_subnet_ids = module.public-subnets.public_subnet_ids
  az_names = module.public-subnets.az_names
  ec2_instances = module.ec2.ec2_instances
  elb_security_grp_id = module.sgs.elb_security_grp_id
}

module "auto-scaling" {
  source  = "../modules/auto-scaling"
  ec2_security_grp_id = module.sgs.ec2_security_grp_id
  ec2_ami = module.ec2.ec2_ami
  key_name = module.ec2.key_name
  elb_name = module.elb.elb_name
  public_subnet_ids = module.public-subnets.public_subnet_ids
}