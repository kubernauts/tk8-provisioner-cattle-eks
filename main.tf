# Terraform Provider Rancher2 module
module "cattle-eks-existing-vpc" {
  source                          = "./modules/cattle-eks-existing-vpc"
  rancher_api_url                 = var.rancher_api_url
  rancher_cluster_name            = var.rancher_cluster_name
  region                          = var.region
  service_role                    = var.service_role
  existing_vpc                    = var.existing_vpc
  vpc_id                          = var.vpc_id
  subnet_id1                      = var.subnet_id1
  subnet_id2                      = var.subnet_id2
  subnet_id3                      = var.subnet_id3
  security_group_name             = var.security_group_name
  instance_type                   = var.instance_type
  AWS_ACCESS_KEY_ID               = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY           = var.AWS_SECRET_ACCESS_KEY
  AWS_DEFAULT_REGION              = var.AWS_DEFAULT_REGION
  disk_size                       = var.disk_size
  ami_id                          = var.ami_id
  associate_worker_node_public_ip = var.associate_worker_node_public_ip
  kubernetes_version              = var.kubernetes_version
  maximum_nodes                   = var.maximum_nodes
  minimum_nodes                   = var.minimum_nodes
  session_token                   = var.session_token
  TOKEN_KEY                       = var.TOKEN_KEY

}

module "cattle-eks-new-vpc" {
  source                          = "./modules/cattle-eks-new-vpc"
  rancher_api_url                 = var.rancher_api_url
  rancher_cluster_name            = var.rancher_cluster_name
  region                          = var.region
  service_role                    = var.service_role
  existing_vpc                    = var.existing_vpc
  vpc_id                          = var.vpc_id
  subnet_id1                      = var.subnet_id1
  subnet_id2                      = var.subnet_id2
  subnet_id3                      = var.subnet_id3
  security_group_name             = var.security_group_name
  instance_type                   = var.instance_type
  AWS_ACCESS_KEY_ID               = var.AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY           = var.AWS_SECRET_ACCESS_KEY
  AWS_DEFAULT_REGION              = var.AWS_DEFAULT_REGION
  disk_size                       = var.disk_size
  ami_id                          = var.ami_id
  associate_worker_node_public_ip = var.associate_worker_node_public_ip
  kubernetes_version              = var.kubernetes_version
  maximum_nodes                   = var.maximum_nodes
  minimum_nodes                   = var.minimum_nodes
  session_token                   = var.session_token
  TOKEN_KEY                       = var.TOKEN_KEY

}
