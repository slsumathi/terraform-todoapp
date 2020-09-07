variable region {
  type        = string
}

variable "az_names" {
  type        = list
}

variable "az_count" {
  type        = number
}

variable "public_subnet_cidr" {
  type        = string
}

variable "vpc_id" {
  type        = string
}
