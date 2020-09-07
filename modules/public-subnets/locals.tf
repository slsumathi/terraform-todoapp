locals {
  az_names = data.aws_availability_zones.available.names
  az_count = length( local.az_names )
  public_subnet_ids = aws_subnet.public-subnets.*.id
}