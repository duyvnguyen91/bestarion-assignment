aws_region  = "ap-southeast-1"
project     = "duynv-demo"
env         = "prod"
db_username = "appuser"

# VPC
vpc_cidr        = "10.20.0.0/16"
public_subnets  = ["10.20.10.0/24", "10.20.11.0/24", "10.20.12.0/24"]
private_subnets = ["10.20.20.0/24", "10.20.21.0/24", "10.20.22.0/24"]

# EKS node group
node_group_min_size        = 2
node_group_max_size        = 4
node_group_desired_size    = 2
node_group_instance_types  = ["t3.medium"]
node_group_capacity_type   = "SPOT"

