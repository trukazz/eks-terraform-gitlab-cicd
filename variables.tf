############################################
# GLOBAL VARIABLES
############################################

variable "name" {
  description = "value"
  type        = string
}

variable "project_name" {
  description = "Name for all resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, stage, prod)"
  type        = string

}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}

}

#############################################################
# VPC SETTINGS
#############################################################

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)

}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

################################################
# EKS SETTINGS 
################################################

variable "cluster_name" {
  description = "cluster name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for EKS"
  type        = string
}

################################################
# NODE GROUP SETTINGS
#################################################

variable "instance_type" {
  description = "EC2 instance type for node group"
  type        = string
  default     = "t3.medium"
}

variable "disk_size" {
  description = "Node group disk size"
  type        = number
  default     = 20
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}



