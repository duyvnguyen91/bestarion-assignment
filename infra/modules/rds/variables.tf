variable "name" {
  description = "Identifier/name for the RDS instance"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for security group"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR to allow DB access from"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for subnet group"
}

variable "engine" {
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  type        = string
  description = "Exact engine version. Set null to use AWS default for the family."
  default     = 16
}

variable "family" {
  type        = string
  description = "Parameter group family"
  default     = "postgres16"
}

variable "major_engine_version" {
  type        = string
  default     = "16"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  type        = number
  default     = 100
}

variable "db_name" {
  type        = string
  default     = "app"
}

variable "username" {
  type        = string
  default     = "appuser"
}

variable "password" {
  type        = string
  sensitive   = true
}

variable "port" {
  type        = number
  default     = 5432
}

variable "multi_az" {
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  type        = bool
  default     = true
}

variable "deletion_protection" {
  type        = bool
  default     = false
}

variable "tags" {
  description = "Common tags to apply"
  type        = map(string)
  default     = {}
}

