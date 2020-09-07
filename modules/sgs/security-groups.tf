# For elastic load balancer
resource "aws_security_group" "ec2_lb_security_group" {
  name        = "ec2-lb-security-group"
  description = "Enable security for ELB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80  
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ELB security group"
  }
}

# For EC2 instance
resource "aws_security_group" "ec2_security_group" {
  name        = "EC2 Security Group"
  description = "Enable security for EC2 instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0  
    to_port     = 0  
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2 security group"
  }
}

# For NAT Instance
resource "aws_security_group" "nat_security_group" {
  name        = "NAT Security Group"
  description = "Allow traffic for private subnets"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0  
    to_port     = 0  
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "NAT security group"
  }
}

# For RDS Instances
resource "aws_security_group" "rds_security_group" {
  name        = "rds-security-group-for-todoapp"
  description = "Enable security for RDS instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    #security_groups = [aws_security_group.ec2_security_group.id]
  }

  egress {
    from_port   = 0  
    to_port     = 0  
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]  
  }


  tags = {
    Name = "RDS security group"
  }
}