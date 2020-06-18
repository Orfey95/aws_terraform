resource "aws_nat_gateway" "aws_nat_gateway" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id

  tags = {
    Name = var.tags_name
  }
}