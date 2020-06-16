provider "aws" {
  access_key = "AKIA2PY6S7KSVEDOREKX"
  secret_key = "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"
  region     = "eu-central-1"
}

module "instance_module1" {
  source                 = "./modules/instance"
  ami                    = "ami-0e342d72b12109f91"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.security_group_module1.security_group]
  key_name               = module.key_pair_module1.key_pair_id
  tags_name              = "Tag1"
}

module "security_group_module1" {
  source              = "./modules/security_group"
  name                = "Allow_SSH"
  description         = "Test"

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

  tags_name           = "Tag1"
}

module "key_pair_module1" {
  source     = "./modules/key_pair"
  key_name   = "TF-key"
  public_key = module.tls_private_key_module1.public_key_openssh
}

module "tls_private_key_module1" {
  source    = "./modules/tls_private_key"
  algorithm = "RSA"
}