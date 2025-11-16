provider "aws" {
  region = "ap-south-1"
}

module "VPC" {
  source = "./Modules/VPC"
  igw_name = "main-igw"
    client_name = "Thermax"
  vpc_cidr = "10.0.0.0/16"
    public_subnet_cidr = "10.0.1.0/24"
    tags = {
      Name = "Main"
    }
  
}


module "aws_security_group" {
    source = "./Modules/SG"
    vpc_id = module.VPC.vpc_id
    sg_name         = "allow_ssh_http"
  sg_description  = "Allow SSH & HTTP"
  
}

module "webserver" {
  source = "./Modules/EC2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = module.VPC.public_subnet_id
  sg_id          = module.aws_security_group.sg_id
  key_name       = var.key_name
  instance_name  = var.instance_name
  user_data = "userdata.sh"
}
  

module "rds" {
  source = "./Modules/RDS"

  db_identifier          = "myapp-db"
  db_subnet_group_name   = "myapp-db-subnet"
  private_subnet_ids     = module.VPC.private_subnets
  storage                = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "Admin123!"
  db_sg_id               = module.aws_security_group.sg_id
}

module "alb" {
  source = "./Modules/ALB"

  lb_name        = "myapp-alb"
  tg_name        = "myapp-tg"
  public_subnets = module.VPC.public_subnet_ids
  lb_sg_id       = module.aws_security_group.sg_id
  vpc_id         = module.VPC.vpc_id
}
