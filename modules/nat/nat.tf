resource "aws_instance" "nat_instance" {
  ami           = var.nat_amis[var.region]
  instance_type = var.ec2_instance_type
  subnet_id = var.public_subnet_ids[0]
  vpc_security_group_ids = ["aws_security_group.nat_security_group.id"]
  source_dest_check = false
  # associate_public_ip_address = true # This is not needed as the associated subnet launched on public ip
  tags = {
    Name = "NAT instance on public subnet ${var.public_subnet_ids[0]}"
  }
}

resource "aws_route_table" "private_route_table_to_nat" {
  vpc_id = var.vpc_id

  route {
      cidr_block = "0.0.0.0/0"
      instance_id = aws_instance.nat_instance.id
  }

  tags = {
    Name = "Private route table for NAT instance"
  }
}

resource "aws_route_table_association" "private-route-table-to-private-subnets-association" {
  count = local.subnet_count
  subnet_id = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_route_table_to_nat.id
}