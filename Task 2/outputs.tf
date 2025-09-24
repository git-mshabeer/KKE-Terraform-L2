output "KKE_vpc_name" {
  description = "The name of the VPC"
  value       = aws_vpc.xfusion_priv_vpc.tags["Name"]
}

output "KKE_subnet_name" {
  description = "The name of the subnet"
  value       = aws_subnet.xfusion_priv_subnet.tags["Name"]
}

output "KKE_ec2_private" {
  description = "The name of the EC2 instance"
  value       = aws_instance.xfusion_priv_ec2.tags["Name"]
}
