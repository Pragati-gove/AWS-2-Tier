module "vpc" {
  source             = "./modules/vpc"
  project            = var.project
  vpc_cidr           = var.vpc_cidr
  azs                = var.azs
  public_subnets     = var.public_subnets
  private_db_subnets = var.private_db_subnets
}

module "sg" {
  source  = "./modules/sg"
  project = var.project
  vpc_id  = module.vpc.vpc_id

}

module "web" {
  source            = "./modules/web"
  project           = var.project
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.sg.alb_sg_id
  web_ec2_sg_id     = module.sg.web_ec2_sg_id
  ami_id            = var.ami_id
  instance_type     = var.instance_type

}

module "db" {
  source = "./modules/db"

  project               = var.project
  vpc_id                = module.vpc.vpc_id
  private_db_subnet_ids = module.vpc.private_db_subnet_ids

  rds_sg_id   = module.sg.rds_sg_id
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}