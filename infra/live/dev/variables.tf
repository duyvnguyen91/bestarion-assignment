variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "project" {
  type        = string
  description = "Project name for tagging and naming"
  default     = "bestarion-demo"
}

variable "env" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "db_username" {
  type        = string
  description = "Database username"
  default     = "appuser"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnet CIDRs"
}

variable "node_group_min_size" {
  type        = number
}

variable "node_group_max_size" {
  type        = number
}

variable "node_group_desired_size" {
  type        = number
}

variable "node_group_instance_types" {
  type        = list(string)
}

variable "node_group_capacity_type" {
  type        = string
  description = "ON_DEMAND or SPOT"
}

