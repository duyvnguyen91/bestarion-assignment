output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID of the VPC"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "IDs of public subnets"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "IDs of private subnets"
}

output "vpc_cidr_block" {
  value       = module.vpc.vpc_cidr_block
  description = "CIDR block of the VPC"
}

