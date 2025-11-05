locals {
  name = "${var.project}-${var.env}"
  tags = {
    Project     = var.project
    Environment = var.env
    ManagedBy   = "terraform"
  }
}

resource "random_password" "db" {
  length      = 16
  lower       = true
  min_lower   = 0
  min_numeric = 0
  min_special = 0
  min_upper   = 0
  numeric     = true
  special     = false
  upper       = true
}

# resource "aws_secretsmanager_secret" "db_credentials" {
#   name = "${local.name}/db-credentials"
#   tags = local.tags
# }

# resource "aws_secretsmanager_secret_version" "db_credentials" {
#   secret_id = aws_secretsmanager_secret.db_credentials.id
#   secret_string = jsonencode({
#     username = var.db_username
#     password = random_password.db.result
#   })
# }

module "vpc" {
  source = "../../modules/vpc"

  name            = local.name
  cidr            = var.vpc_cidr
  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = local.tags
}

module "eks" {
  source = "../../modules/eks"

  cluster_name    = "${local.name}-eks"
  vpc_id          = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets

  node_group_min_size       = var.node_group_min_size
  node_group_max_size       = var.node_group_max_size
  node_group_desired_size   = var.node_group_desired_size
  node_group_instance_types = var.node_group_instance_types
  node_group_capacity_type  = var.node_group_capacity_type

  tags = local.tags
}

module "rds" {
  source = "../../modules/rds"

  name               = "${local.name}-db"
  vpc_id             = module.vpc.vpc_id
  vpc_cidr_block     = module.vpc.vpc_cidr_block
  private_subnet_ids = module.vpc.private_subnets

  db_name   = "app"
  username  = var.db_username
  password  = random_password.db.result
  multi_az  = false

  tags = local.tags
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}

