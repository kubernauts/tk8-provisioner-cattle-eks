variable "TOKEN_KEY" {
  description = "Rancher token key"
  type        = string
}

variable "service_role" {
  description = "Service linked role for EKS"
  type        = string
}

variable "associate_worker_node_public_ip" {
  description = "Associate public IP with worker nodes"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}
variable "maximum_nodes" {
  description = "Maximum worker nodes"
  type        = string
}

variable "minimum_nodes" {
  description = "Minimum size for worker nodes"
  type        = string
}

variable "instance_type" {
  description = "Instance type for worker nodes"
  type        = string
}

variable "ami_id" {
  description = "AMI id for the instance"
  type        = string
}

variable "session_token" {
  description = "Session token to use with the client key and secret key if applicable"
  type        = string
}

variable "disk_size" {
  description = "Root disk size for instances in GB"
  type        = string
}

variable "rancher_api_url" {
  description = "Rancher API URL"
  type        = string
}

variable "rancher_cluster_name" {
  description = "Rancher cluster name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "existing_vpc" {
  description = "Use existing VPC for creating clusters"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}


variable "subnet_id1" {
  default     = ""
  description = "subnet id"
  type        = string
}

variable "subnet_id2" {
  default     = ""
  description = "Subnet Id 2"
  type        = string
}

variable "subnet_id3" {
  default     = ""
  description = "Subnet Id 3"
  type        = string
}


variable "security_group_name" {
  description = "security group id"
  type        = string
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key"
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret key"
}

variable "AWS_DEFAULT_REGION" {
  description = "AWS default region"
}
