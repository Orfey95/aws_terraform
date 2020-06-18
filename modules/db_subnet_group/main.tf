resource "aws_db_subnet_group" "aws_db_subnet_group" {
  name       = var.name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.tags_name
  }
}