module "eks" {
  source          = "git@github.com:periclesjunior/tf-infra-eks-modules.git?ref=main"
  cidr_block      = "10.0.0.0/16"
  project_name    = "nina-eks-001"
  region          = "us-east-1"
  tags            = local.tags
}
