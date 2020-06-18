resource "aws_eip" "aws_eip" {
  tags = {
    Name = var.tags_name
  }
}