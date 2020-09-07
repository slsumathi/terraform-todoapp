resource "aws_db_instance" "postgres_db_instance" {
  name                 = "postgres-db-instance-${terraform.workspace}"
  identifier           = "postgres-rds-instance"

  allocated_storage    = 20

  max_allocated_storage = 100

  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "9.6.9"
  instance_class       = "db.t2.micro"
  username             = "postgres"
  password             = "postgres"
  #parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = aws_db_subnet_group.aws_db_subnet_group.id

  security_group_names = [var.rds_security_grp_name]

  # Make sure that backup_window and auto minor version upgrade will
  # not happen at the same time
  backup_window        = "01:00-01:30"  # This happens once in a day ( every day )

  # Minor version upgrades will happen once in a week, if it is set to true
  auto_minor_version_upgrade = false
}

resource "aws_db_subnet_group" "aws_db_subnet_group" {
  name       = "rds-postgres-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "DB subnet group for postgres RDS"
  }
}