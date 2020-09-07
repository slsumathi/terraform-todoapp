resource "aws_instance" "todoapp_ec2_instance" {
  count         = var.ec2_count
  ami           = var.ec2_amis[var.region]
  instance_type = var.ec2_instance_type
  subnet_id     = var.public_subnet_ids[count.index]
  tags          = var.ec2_tags

  # Whenever you update user-data, terraform is going to kill the ec2 insatnce
  # and initializes new ec2 instance with the updated user-data as user_data
  # is launch time executable script

  user_data     = file("${path.module}/scripts/ec2_launch.sh")

  # Attach security groups to EC2 instances
  vpc_security_group_ids = [var.ec2_security_grp_id]

  key_name = "aws_key_pair.ec2_key_pair.key_name"
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "ec2-key-pair"
  public_key = file("${path.module}/ec2.pub")
}