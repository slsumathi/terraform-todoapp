variable "nat_amis" {
  type        = map
  default = {
    ap-south-1 = "ami-0a780d5bac870126a"
  }
  description = "NAT (AMI}EC2 instance id"
}

variable "region" {
  type        = string
}

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 new instance type"
}

variable "public_subnet_ids" {
}

variable "private_subnet_ids" {
}

variable "public_subnet_cidr" {
  type        =  string
}

variable "nat_security_grp_id" {
  type        = string
}

variable "vpc_id" {
  type        = string
}

