output "ec2_instances" {
  value       = aws_instance.todoapp_ec2_instance.*.id
}

output "ec2_ami" {
  value       = var.ec2_amis[var.region]
}

output "key_name" {
  value       = aws_key_pair.ec2_key_pair.key_name
}
