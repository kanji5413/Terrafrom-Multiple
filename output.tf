output "public_cidrs" {
  description = "List of public subnet CIDR blocks"
  value       = var.public_cidrs
}

output "private_cidrs" {
  description = "List of private subnet CIDR blocks"
  value       = var.private_cidrs
}

output "azs" {
  description = "List of availability zones"
  value       = var.azs
}

output "database_cidrs" {
  description = "List of database subnet CIDR blocks"
  value       = var.database_cidrs
}

output "vpc_name" {
  description = "Name of the VPC"
  value       = var.vpc_name
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = var.vpc_cidr
}
