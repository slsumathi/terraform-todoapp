resource "aws_subnet" "private-subnets" {
  count = length( local.first_two_zones ) # Pick availability zones 0 and 1
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet( var.public_subnet_cidr, 8, count.index + var.az_count )
  availability_zone = var.az_names[count.index]

  tags = {
    Name = "Private Subnet - ${count.index + 1} "
  }
}