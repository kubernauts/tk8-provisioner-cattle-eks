# TK8 Cattle EKS Provisioner

Using cattle-eks provisioner with TK8

## Introduction:

The TK8’s new cattle-eks provisioner uses the Terraform’s Rancher2 Provider for creating a EKS cluster via Rancher resources.

## Prerequisites:

The initial release of the provisioner requires the following things to be ready before using cattle-eks provisioner:

* A Rancher server installation.
* Rancher API URL
* Rancher token key. Create them from the Rancher GUI.
* AWS access key and secret key.
* Terraform 0.12

## Setting Environment Variables:

The following environment variables need to be set up:

* `TF_VAR_TOKEN_KEY` - Rancher token key
* `TF_VAR_AWS_ACCESS_KEY_ID` - AWS access key
* `TF_VAR_AWS_SECRET_ACCESS_KEY` - AWS secret key
* `TF_VAR_AWS_DEFAULT_REGION` - AWS default region
* `AWS_DEFAULT_REGION` - Required for provisioner
* `AWS_ACCESS_KEY_ID` - AWS access key
* `AWS_SECRET_ACCESS_KEY` - AWS secret key

## Getting Started:

*  Creating an EKS cluster along with VPC, security groups, subnets, etc. In this case, the other AWS resource creation is handled by Rancher.

Example `config.yaml`:

```yaml
cattle-eks:
  rancher_cluster_name: "tk8-tpr2-eks"
  rancher_api_url: "https://rancher.xyz.com/v3"
  region: "eu-central-1"
  existing_vpc: false
  vpc_id:
  subnets:
    subnet_id1:
    subnet_id2:
    subnet_id3:
  security_group_name:
  disk_size: "20"
  kubernetes_version: "1.12"
  ami_id: "ami-058487fd109552697"
  maximum_nodes: 3
  minimum_nodes: 1
  session_token:
  instance_type: "t2.medium"
  associate_worker_node_public_ip: true
  service_role:
```

* Creating an EKS cluster in existing VPC:

Example `config.yaml`:

```yaml
cattle-eks:
  rancher_cluster_name: "tk8-tpr2-eks"
  rancher_api_url: "https://rancher.xyz.com/v3"
  region: "eu-central-1"
  existing_vpc: false
  vpc_id: "my-vpc-id"
  subnets:
    subnet_id1: "subnet-id-1"
    subnet_id2: "subnet-id-2"
    subnet_id3: "subnet-id-3"
  security_group_name: "my-security-group"
  disk_size: "20"
  kubernetes_version: "1.12"
  ami_id: "ami-058487fd109552697"
  maximum_nodes: 3
  minimum_nodes: 1
  session_token:
  instance_type: "t2.medium"
  associate_worker_node_public_ip: true
  service_role:
```

## Cattle EKS Deployment

1. Download the latest binary based on your platform from here - https://github.com/kubernauts/tk8/releases
2. Set environment variables.
3. Use a `config.yaml` from the above example.
4. Run `tk8 cluster install cattle-eks`.

## Field Reference
* `disk_size`: Disk size for the instances.

* `rancher_cluster_name`: EKS cluster name.

* `rancher_api_url`: The API URL for rancher server.

* `region`: (Mandatory) The AWS region in which you want to deploy the cluster.

* `existing_vpc`: (Optional) Specify this if you want to create the cluster in existing VPC. Else, keep it blank. The possible values for this field are boolean values: true and false.

* `vpc_id`: (Optional) VPC ID. Specify if you want to create the cluster in existing VPC.

* `subnet_id1`: (Optional) Subnet ID. Specify if you want to create the cluster in existing VPC.

* `subnet_id2`: (Optional) Subnet ID. Specify if you want to create the cluster in existing VPC.

* `subnet_id3`: (Optional) Subnet ID. Specify if you want to create the cluster in existing VPC.

* `security_group_name`: (Optional) Security group name. Specify if you want to create the cluster in existing VPC.

* `ami_id`: (Mandatory). Set this field to specify AMI ID for creating instances in the cluster.

* `kubernetes_version`: (Mandatory) The Kubernetes version to be used for creating EKS cluster.

* `maximum_nodes`: (Mandatory) The maximum number of worker nodes for the EKS cluster.

* `minimum_nodes`: (Mandatory) The minimum number of worker nodes for the EKS cluster.

* `session_token`: (Optional) A session token to use with the client key and secret if applicable (string)

* `instance_type`: (Mandatory) Instance type for worker nodes.

* `associate_worker_node_public_ip`: (Optional) Associate public ip EKS worker nodes. Default true (bool)

* `service_role`: (Optional) The service role to use to perform the cluster operations in AWS. If it's not specified Rancher will create a new service role (string)
