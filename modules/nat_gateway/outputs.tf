output "nat_gateway_id" {
  value = aws_nat_gateway.aws_nat_gateway.id
  depends_on = [module.instance]
}