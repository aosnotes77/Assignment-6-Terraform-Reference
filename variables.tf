# environment variables
variable "region" {
  description = "region to create resources"
  type        = string
}

variable "project_name" {
  description = "project name"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = string
}

# # vpc variables
# variable "vpc_cidr" {
#   description = "vpc cidr block"
#   type        = string
# }

# variable "public_subnet_az1_cidr" {
#   description = "public subnet az1 cidr block"
#   type        = string
# }

# variable "public_subnet_az2_cidr" {
#   description = "public subnet az2 cidr block"
#   type        = string
# }

# variable "private_app_subnet_az1_cidr" {
#   description = "private app subnet az1 cidr block"
#   type        = string
# }

# variable "private_app_subnet_az2_cidr" {
#   description = "private app subnet az2 cidr block"
#   type        = string
# }

# variable "private_data_subnet_az1_cidr" {
#   description = "private data subnet az1 cidr block"
#   type        = string
# }

# variable "private_data_subnet_az2_cidr" {
#   description = "private data subnet az2 cidr block"
#   type        = string
# }

# # secrets manager variables
# variable "secrets_manager_secret_name" {
#   description = "the secrets manager secret name"
#   type        = string
# }

# # rds variables
# variable "multi_az_deployment" {
#   description = "create a standby db instance"
#   type        = bool
# }

# variable "database_instance_identifier" {
#   description = "database instance identifier"
#   type        = string
# }

# variable "database_instance_class" {
#   description = "database instance type"
#   type        = string
# }

# variable "publicly_accessible" {
#   description = "controls if instance is publicly accessible"
#   type        = bool
# }

# # acm variables
# variable "domain_name" {
#   description = "domain name"
#   type        = string
# }

# variable "alternative_names" {
#   description = "sub domain name"
#   type        = string
# }

# # sns topic variables
# variable "operator_email" {
#   description = "a valid email address"
#   type        = string
# }

# # auto scaling group variables
# variable "amazon_linux_ami_id" {
#   description = "default amazon linux ami"
#   type        = string
# }

# variable "ec2_instance_type" {
#   description = "ec2 instance type"
#   type        = string
# }

# # route-53 variables
# variable "record_name" {
#   description = "sub domain name"
#   type        = string
# }
