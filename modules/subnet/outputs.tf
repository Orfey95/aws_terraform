output "vpc_subnet_id" {
  value = aws_subnet.aws_subnet.id
  depends_on = [module.instance]
}