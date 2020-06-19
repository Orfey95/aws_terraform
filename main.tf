// --------------- INSTANCE ---------------
module "instance_1" {
  source                 = "./modules/instance"
  ami                    = "ami-0e342d72b12109f91"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.security_group_1.security_group]
  key_name               = module.key_pair_1.key_pair_id
  subnet_id              = module.subnet_public_a.vpc_subnet_id
  tags_name              = "Frolov TF Instance"
}
// ------------ SECURITY GROUP -------------
module "security_group_1" {
  source              = "./modules/security_group"
  name                = "Allow_SSH"
  description         = "Test"
  vpc_id              = module.vpc_1.vpc_id

  ingress_description = "Test ingress"
  ingress_from_port   = "22"
  ingress_to_port     = "22"
  ingress_protocol    = "tcp"
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_description  = "Test egress"
  egress_from_port    = "0"
  egress_to_port      = "0"
  egress_protocol     = "-1"
  egress_cidr_blocks  = ["0.0.0.0/0"]

  tags_name           = "Frolov TF SG"
}
// -------------- SSH KEY PAIR ---------------
module "key_pair_1" {
  source     = "./modules/key_pair"
  key_name   = "TF-key"
  public_key = module.tls_private_key_1.public_key_openssh
}
// ------------ SSH KEY GENERATOR ------------
module "tls_private_key_1" {
  source    = "./modules/tls_private_key"
  algorithm = "RSA"
}
// --------------- DB INSTANCE ---------------
module "db_instance_1" {
  source    = "./modules/db_instance"
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "fdb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"

  db_subnet_group_name = module.db_subnet_group_1.db_subnet_group_id

  identifier           = "frolov-tf-db"  
  skip_final_snapshot  = true
  tags_name            = "Frolov TF DB"
}
// -------------- DB SUBNET GROUP -------------
module "db_subnet_group_1" {
  source     = "./modules/db_subnet_group"
  name       = "main"
  subnet_ids = [module.subnet_private_a.vpc_subnet_id, module.subnet_private_b.vpc_subnet_id]
  tags_name  = "Frolov TF DB_SG"
}
// ------------------- ELB -------------------
module "elb_1" {
  source                     = "./modules/elb"
  name                       = "frolov-tf-elb"
  subnets                    = [module.subnet_public_a.vpc_subnet_id, module.subnet_public_b.vpc_subnet_id]
  listener_instance_port     = 80
  listener_instance_protocol = "http"
  listener_lb_port           = 80
  listener_lb_protocol       = "http"
  instances                  = [module.instance_1.instance_id]
  cross_zone_load_balancing  = true
  tags_name                  = "Frolov TF ELB"
}
// ------------------- VPC -------------------
module "vpc_1" {
  source           = "./modules/vpc"
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags_name        = "Frolov TF Network"
}
// ----------- INTERNET GATEWAY ---------------
module "internet_gateway_1" {
  source    = "./modules/internet_gateway"
  vpc_id    = module.vpc_1.vpc_id
  tags_name = "Frolov TF Network IGW"
}
// ------------------ SUBNET ------------------
module "subnet_public_a" {
  source                  = "./modules/subnet"
  vpc_id                  = module.vpc_1.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"  
  map_public_ip_on_launch = true
  tags_name               = "Frolov TF Public-a"
}

module "subnet_public_b" {
  source                  = "./modules/subnet"
  vpc_id                  = module.vpc_1.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true
  tags_name               = "Frolov TF Public-b"
}

module "subnet_private_a" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc_1.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-central-1a"
  tags_name         = "Frolov TF Private-a"
}

module "subnet_private_b" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc_1.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-central-1b"
  tags_name         = "Frolov TF Private-b"
}
// ----------- ELASTIC IP ---------------
module "eip_1" {
  source    = "./modules/eip"
  tags_name         = "Frolov TF EIP NAT-a"
}

module "eip_2" {
  source    = "./modules/eip"
  tags_name         = "Frolov TF EIP NAT-b"
}
// ----------- NAT GATEWAY ---------------
module "nat_gateway_a" {
  source        = "./modules/nat_gateway"
  allocation_id = module.eip_1.eip_id
  subnet_id     = module.subnet_public_a.vpc_subnet_id
  tags_name     = "Frolov TF Network NAT-a"
}

module "nat_gateway_b" {
  source        = "./modules/nat_gateway"
  allocation_id = module.eip_2.eip_id
  subnet_id     = module.subnet_public_b.vpc_subnet_id
  tags_name     = "Frolov TF Network NAT-b"
}
// ----------- ROUTE TABLE ---------------
module "route_table_public" {
  source     = "./modules/route_table"
  vpc_id     = module.vpc_1.vpc_id
  cidr_block = "0.0.0.0/0"
  gateway_id = module.internet_gateway_1.internet_gateway_id
  tags_name  = "Frolov TF Public RT"
}

module "route_table_private_a" {
  source     = "./modules/route_table"
  vpc_id     = module.vpc_1.vpc_id
  cidr_block = "0.0.0.0/0"
  gateway_id = module.nat_gateway_a.nat_gateway_id
  tags_name  = "Frolov TF Private RT-a"
}

module "route_table_private_b" {
  source     = "./modules/route_table"
  vpc_id     = module.vpc_1.vpc_id
  cidr_block = "0.0.0.0/0"
  gateway_id = module.nat_gateway_b.nat_gateway_id
  tags_name  = "Frolov TF Private RT-b"
}
// ----------- ROUTE TABLE ASSOCIATION ---------------
module "route_table_association_public_subnet_a_with_igw" {
  source         = "./modules/route_table_association"
  subnet_id      = module.subnet_public_a.vpc_subnet_id
  route_table_id = module.route_table_public.route_table_id
}

module "route_table_association_public_subnet_b_with_igw" {
  source         = "./modules/route_table_association"
  subnet_id      = module.subnet_public_b.vpc_subnet_id
  route_table_id = module.route_table_public.route_table_id
}

module "route_table_association_private_subnet_a_with_nat_gw_a" {
  source         = "./modules/route_table_association"
  subnet_id      = module.subnet_private_a.vpc_subnet_id
  route_table_id = module.route_table_private_a.route_table_id
}

module "route_table_association_private_subnet_b_with_nat_gw_b" {
  source         = "./modules/route_table_association"
  subnet_id      = module.subnet_private_b.vpc_subnet_id
  route_table_id = module.route_table_private_b.route_table_id
}