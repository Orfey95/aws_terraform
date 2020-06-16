resource "aws_instance" "aws_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name

  tags = {
    Name = var.tags_name
  }
}
