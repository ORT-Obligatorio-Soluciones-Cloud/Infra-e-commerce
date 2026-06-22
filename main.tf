module "vpc" {
  source = "./Modules/vpc"
}

module "loadbalancer" {
  source = "./Modules/lb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "autoscaling" {
  source = "./Modules/autoscaling"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  target_group_arn = module.loadbalancer.target_group_arn
  alb_security_group_id = module.loadbalancer.alb_security_group_id
  db_database = module.database.db_name
  db_endpoint = module.database.db_instance_endpoint
  db_password = module.database.db_password
  db_user = module.database.db_user
  git_token = var.git_token
}

module "database" {
  source = "./Modules/db"
  vpc_id = module.vpc.vpc_id
  private_subnet_rds_ids = module.vpc.private_subnet_rds_ids
  db_password = var.db_password
}
