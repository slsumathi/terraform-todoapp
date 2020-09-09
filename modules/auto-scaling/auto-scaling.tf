# Auto scaling uses this launch configuration while adding new EC2 instances as part of auto scaling
resource "aws_launch_configuration" "ec2_launch_config" {
  name          = "ec2-launch-configuration"
  image_id      = var.ec2_ami
  instance_type = "t2.micro"
  key_name      = var.key_name
  user_data     = file(abspath("../modules/ec2/scripts/ec2_launch.sh"))
  #iam_instance_profile = "aws_iam_instance_profile.ec2_s3_profile.name"
  security_groups = [var.ec2_security_grp_id]
}

resource "aws_autoscaling_group" "ec2_autoscaling_group" {
  name                      = "ec2-autoscaling-group"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 60
  health_check_type         = "ELB"
  load_balancers            = [var.elb_name]
  vpc_zone_identifier       = var.public_subnet_ids # For distributing instances when they scale out
  launch_configuration      = aws_launch_configuration.ec2_launch_config.name
}

resource "aws_autoscaling_policy" "ec2_add_instances_policy" {
  name                   = "ec2-add-instances-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.ec2_autoscaling_group.name
}

resource "aws_autoscaling_policy" "ec2_remove_instances_policy" {
  name                   = "ec2-remove-instances-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.ec2_autoscaling_group.name
}