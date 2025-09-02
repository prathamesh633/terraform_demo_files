variable "name" {
  type        = string
  description = "Name prefix"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for RDS subnet group"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security groups for RDS"
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}