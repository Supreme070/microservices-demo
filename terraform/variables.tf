# variables.tf

variable "cluster-name" {
  description = "The name of the EKS cluster"
  default     = "eks-cluster"
  type        = string
}

variable "key_pair_name" {
  description = "The name of the key pair for EC2 instances"
  default     = "mskey"
  type        = string
}

variable "eks_node_instance_type" {
  description = "EC2 instance type for the EKS nodes"
  default     = "t2.micro"
  type        = string
}

variable "region" {
  description = "The AWS region"
  default     = "us-west-2"
  type        = string
}

variable "workstation-external-cidr" {
  description = "CIDR block for the external IP address of your workstation"
  default     = "0.0.0.0/32"
  type        = string
}

variable "memorystore" {
  description = "Flag to enable or disable Google Cloud Memorystore"
  default     = false 
  type        = bool
}

