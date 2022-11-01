output "aws_autoscaling_group" {
  description = "The id of the autoscaling group"
  value       = aws_autoscaling_group.main.id
} 