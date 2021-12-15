provider "aws" {
  region = "${var.region}"
}

module "vpc" {
  source = "./modules/vpc"
}

module "alb" {
  source = "./modules/alb"
  public_subnet_1_id = "${module.vpc.public_subnet_1_id}"
  public_subnet_2_id = "${module.vpc.public_subnet_2_id}"
  allow_ssh_sg = "${module.vpc.allow_ssh_sg}"
  allow_http_sg = "${module.vpc.allow_http_sg}"
}