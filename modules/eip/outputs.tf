output "eip_id" {
  value = aws_eip.aws_eip.id
  depends_on = [module.nat_gateway]
}