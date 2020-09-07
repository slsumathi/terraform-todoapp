resource "aws_vpc" "todoapp_vpc" {
    cidr_block       = var.vpc_cidr
    instance_tenancy = "default"

    tags = {
        Name = var.vpc_name
        Environment = terraform.workspace
        Location = var.location
    }
}