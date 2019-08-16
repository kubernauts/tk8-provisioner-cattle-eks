variable "TOKEN_KEY" {
  description = "Rancher token key"
  type        = string
}

variable "service_role" {
  default     = ""
  description = "Service linked role for EKS"
  type        = string
}

variable "associate_worker_node_public_ip" {
  default     = true
  description = "Associate public IP with worker nodes"
  type        = string
}

variable "kubernetes_version" {
  default     = ""
  description = "Kubernetes version"
  type        = string
}
variable "maximum_nodes" {
  default     = ""
  description = "Maximum worker nodes"
  type        = string
}

variable "minimum_nodes" {
  default     = ""
  description = "Minimum size for worker nodes"
  type        = string
}

variable "instance_type" {
  default     = ""
  description = "Instance type for worker nodes"
  type        = string
}

variable "ami_id" {
  default     = ""
  description = "AMI id for the instance"
  type        = string
}

variable "session_token" {
  default     = ""
  description = "Session token to use with the client key and secret key if applicable"
  type        = string
}

variable "disk_size" {
  default     = ""
  description = "Root disk size for instances in GB"
  type        = string
}

variable "rancher_api_url" {
  default     = ""
  description = "Rancher API URL"
  type        = string
}

variable "rancher_cluster_name" {
  default     = ""
  description = "Rancher cluster name"
  type        = string
}

variable "region" {
  default     = ""
  description = "AWS region"
  type        = string
}

variable "existing_vpc" {
  default     = ""
  description = "Use existing VPC for creating clusters"
  type        = string
}

variable "vpc_id" {
  default     = ""
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
  default     = ""
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
