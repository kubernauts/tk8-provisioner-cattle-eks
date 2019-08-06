# Provider config
# Create a new rancher2 rke Cluster
resource "rancher2_cluster" "rancher-custom" {
  count       = ! var.existing_vpc ? 1 : 0
  name        = var.rancher_cluster_name
  description = "${var.rancher_cluster_name} Kubernetes cluster"
  eks_config {
    access_key                      = var.AWS_ACCESS_KEY_ID
    secret_key                      = var.AWS_SECRET_ACCESS_KEY
    service_role                    = var.service_role
    ami                             = var.ami_id
    associate_worker_node_public_ip = var.associate_worker_node_public_ip
    instance_type                   = var.instance_type
    kubernetes_version              = var.kubernetes_version
    maximum_nodes                   = var.maximum_nodes
    minimum_nodes                   = var.minimum_nodes
    node_volume_size                = var.disk_size
    region                          = var.region
    session_token                   = var.session_token
  }

}
