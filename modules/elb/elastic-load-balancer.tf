# Create a new load balancer
resource "aws_elb" "ec2_load_balancer" {
  name               = "ec2-load-balancer-${terraform.workspace}"
  subnets            = var.public_subnet_ids
  security_groups    = [var.elb_security_grp_id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = var.ec2_instances

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 30

  tags = {
    Name = "ec2-elastic-load-balancer"
  }
}