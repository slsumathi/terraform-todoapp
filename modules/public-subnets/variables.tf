variable "public_subnet_cidr" {
  type        = string
  default     = "10.20.0.0/16"
  description = "Public Subnet CIDR"
}

variable "vpc_id" {
  type        = string
}
