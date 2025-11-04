variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster Kubernetes version"
  type        = string
  default     = "1.30"
}

variable "cluster_endpoint_public_access" {
  description = "Whether the EKS cluster API endpoint is public"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "VPC ID where EKS will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for worker nodes"
  type        = list(string)
}

variable "node_group_min_size" {
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  type        = number
  default     = 3
}

variable "node_group_desired_size" {
  type        = number
  default     = 1
}

variable "node_group_instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_group_capacity_type" {
  type        = string
  description = "ON_DEMAND or SPOT"
  default     = "ON_DEMAND"
}

variable "tags" {
  description = "Common tags to apply"
  type        = map(string)
  default     = {}
}

