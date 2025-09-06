module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.vpc.subnet_id
  control_plane_sg = module.vpc.control_plane_sg
  worker_node_sg = module.vpc.worker_node_sg
}