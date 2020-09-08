output "elb_security_grp_id" {
  value       = aws_security_group.ec2_lb_security_group.id
}

output "ec2_security_grp_id" {
  value       = aws_security_group.ec2_security_group.id
}

output "nat_security_grp_id" {
  value       = aws_security_group.nat_security_group.id
}

output "rds_security_grp_id" {
  value       = aws_security_group.rds_security_group.id
}