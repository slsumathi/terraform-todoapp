variable "public_subnet_ids" {
  type        = list(string)
}

variable "ec2_instances" {
  type        = list(string)
}

variable "elb_security_grp_id" {
  type        = string
}

variable "az_names" {
  type        = list(string)
}

