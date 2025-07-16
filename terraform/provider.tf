terraform {
  backend "s3" {
    bucket = "terraform-aws-eks-poc"
    key    = "poc/terraform.state"
    region = "us-east-1"
  }
}
