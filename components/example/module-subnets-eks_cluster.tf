module "subnets_eks_cluster" {
  source = "../../modules/subnets"

  name         = "ekscluster"
  project      = var.project
  environment  = var.environment
  component    = var.component
  default_tags = local.default_tags

  vpc_id             = module.vpc_core.vpc_id
  cidr_blocks        = var.eks_cluster_subnets_cidr_blocks
  availability_zones = data.aws_availability_zones.available.names
  route_table_ids    = [module.vpc_core.private_route_table_id]
}
