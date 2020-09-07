variable "ec2_tags" {
  type        = map
  default = {
    Name = "EC2 instance"
  }
  description = "EC2 tags"
}

variable "ec2_count" {
  type        = string
  default     = "2"
  description = "EC2 count"
}

variable "ec2_amis" {
  type        = map
  // AMI ids are specific to region, we can't use the same AMI id in all regions
  default = {
    ap-south-1 = "ami-0ebc1ac48dfd14136"
  }
  description = "EC2 AMI instance ids"
}

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "description"
}

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "Mumbai"
}

variable "public_subnet_ids" {
  type        = list(string)
}

variable "ec2_security_grp_id" {
  type        = string
}