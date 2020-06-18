output "internet_gateway_id" {
  value = aws_internet_gateway.aws_internet_gateway.id
  depends_on = [module.instance]
}