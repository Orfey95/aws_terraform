resource "aws_db_instance" "aws_db_instance" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
    
  db_subnet_group_name = var.db_subnet_group_name

  identifier           = var.identifier
  skip_final_snapshot  = var.skip_final_snapshot

  tags = {
    Name = var.tags_name
  }
}