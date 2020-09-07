variable vpc_cidr {
  type        = string
  default     = "10.20.0.0/16"
  description = "CIDR for VPC"
}

variable vpc_name {
  type        = string
  default     = "todoapp-vpc"
  description = "VPC name"
}

variable location {
  type        = string
  default     = "India"
  description = "Hyderabad in India"
}