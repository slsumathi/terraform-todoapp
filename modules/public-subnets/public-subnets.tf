resource "aws_subnet" "public-subnets" {
  count = length( local.az_names )
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet( var.public_subnet_cidr, 8, count.index )
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet - ${count.index + 1} "
  }
}