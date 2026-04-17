locals {
  tags = {
    Departament   = "DevOps"
    Organizations = "xtpo"
    Project       = "EKS"
    Environment   = "DEV"
  }

  auto_scale_options = {
    min     = 1
    max     = 2
    desired = 1
  }
}
