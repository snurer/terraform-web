output "vpc_id" {
  description = "The ID of the custom VPC"
  value       = aws_vpc.main.id
}

output "public_subnet" {
  description = "The IDs of the public subnets in the custom VPC"
  value       = aws_subnet.public_subnet[*].id
}


output "private_subnet_id" {
  description = "The IDs of the private subnets in the custom VPC"
  value       = aws_subnet.private_subnet[*].id
}

