terraform {
  backend "s3" {
    bucket         = "eks-terraform-gitlab-cicd"
    key            = "eks/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "eks-terraform-gitlab-cicd"
    encrypt        = true
  }
}
