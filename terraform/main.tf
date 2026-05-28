module "eks" {
  source     = "git@github.com:periclesjunior/tf-infra-eks-modules.git?ref=main"
  cidr_block = "10.0.0.0/16"
  vpc_additional_cidrs = [
    "100.64.0.0/16"
  ]
  service_ipv4_cidr = "10.100.0.0/16"
  project_name      = "nina-eks-001"
  region            = "us-east-1"
  tags              = local.tags
  auto_scale_options = {
    min     = 2
    max     = 6
    desired = 3
  }
  disk_size               = "150"
  ami_type                = "AL2023_x86_64_STANDARD"
  instance_types          = ["t3.medium"]
  capacity_type           = "ON_DEMAND"
  cluster_version         = "1.35"
  endpoint_private_access = "true"
  endpoint_public_access  = "true"
  access_entries = {
    cluster-admin = {
      principal_arn = "arn:aws:iam::533267318959:user/devops-nina"
      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    },
    namespace-viewer = {
      principal_arn     = "arn:aws:iam::533267318959:user/devops-yuna"
      kubernetes_groups = ["viewers"]
      policy_associations = {
        viewer = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            type       = "namespace"
            namespaces = ["poc", "dev"]
          }
        }
      }
    }
  }
  addon_coredns_version   = "v1.14.2-eksbuild.4"
  addon_kubeproxy_version = "v1.35.3-eksbuild.5"
  addon_cni_version       = "v1.21.1-eksbuild.8"
}
