resource "aws_internet_gateway" "igw" {
    vpc_id = var.vpc_id
    tags = {
        Name = "Internet Gateway"
    }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = var.vpc_id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public route table"
  }
}

resource "aws_route_table_association" "route-public-subnet-association" {
    count = var.az_count
    subnet_id      = var.public_subnet_ids[count.index]
    route_table_id = aws_route_table.public-route-table.id # Route table is same for all subnets
}