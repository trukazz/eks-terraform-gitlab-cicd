module "vpc" {
  source               = "./modules/vpc"
  name                 = var.name
  cluster_name         = var.cluster_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
  tags                 = var.tags
}

module "eks" {
  source             = "./modules/eks"
  name               = var.cluster_name
  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  tags               = var.tags
}

module "node_group" {
  source             = "./modules/node_groups"
  cluster_name       = module.eks.cluster_name
  private_subnet_ids = module.vpc.private_subnet_ids
  instance_type      = var.instance_type
  disk_size          = var.disk_size
  desired_size       = var.desired_size
  min_size           = var.min_size
  max_size           = var.max_size
  tags               = var.tags

}
