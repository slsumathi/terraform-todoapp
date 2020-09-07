output "ec2_instances" {
  value       = aws_instance.todoapp_ec2_instance.*.id
}