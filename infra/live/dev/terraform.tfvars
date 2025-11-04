aws_region  = "ap-southeast-1"
project     = "duynv-demo"
env         = "dev"
db_username = "appuser"

# VPC
vpc_cidr        = "10.10.0.0/16"
public_subnets  = ["10.10.10.0/24", "10.10.11.0/24", "10.10.12.0/24"]
private_subnets = ["10.10.20.0/24", "10.10.21.0/24", "10.10.22.0/24"]

# EKS node group
node_group_min_size        = 1
node_group_max_size        = 3
node_group_desired_size    = 1
node_group_instance_types  = ["t3.medium"]
node_group_capacity_type   = "SPOT"

