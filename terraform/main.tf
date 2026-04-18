module "eks" {
  source       = "git@github.com:periclesjunior/tf-infra-eks-modules.git?ref=main"
  cidr_block   = "10.0.0.0/16"
  project_name = "nina-eks-001"
  region       = "us-east-1"
  tags         = local.tags
  auto_scale_options = {
    min     = 1
    max     = 2
    desired = 1
  }
  disk_size               = "150"
  ami_type                = "AL2023_x86_64_STANDARD"
  instance_types          = ["t3.medium"]
  capacity_type           = "ON_DEMAND"
  cluster_version         = "1.35"
  endpoint_private_access = "true"
  endpoint_public_access  = "true"
}
