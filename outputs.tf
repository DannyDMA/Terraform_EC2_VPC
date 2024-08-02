output "custom_vpc_id" {
  description = "ID of the custom VPC created"
  value       = aws_vpc.my_vpc.id
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance in the default VPC"
  value       = aws_instance.amazon_linux.public_ip
}
