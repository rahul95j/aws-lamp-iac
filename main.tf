provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "webapp-db" {
  source              = "./modules/db"
  private_subnet_1_id = module.vpc.private_subnet_1_id
  private_subnet_2_id = module.vpc.private_subnet_2_id
  allow_sql_sg        = module.vpc.allow_sql_sg
}

module "asg" {
  source             = "./modules/web"
  region             = var.region
  allow_ssh_sg       = module.vpc.allow_ssh_sg
  allow_http_sg      = module.vpc.allow_http_sg
  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id
}

module "alb" {
  source             = "./modules/alb"
  region             = var.region
  webapp-asg         = module.asg.webapp-asg
  vpc_id             = module.vpc.vpc_id
  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id
  allow_ssh_sg       = module.vpc.allow_ssh_sg
  allow_http_sg      = module.vpc.allow_http_sg
}
