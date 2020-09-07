locals {
    private_subnet_ids = aws_subnet.private-subnets.*.id
    first_two_zones = slice( var.az_names, 0, 2 )
}