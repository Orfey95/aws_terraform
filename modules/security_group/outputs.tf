output "security_group" {
  value = aws_security_group.aws_security_group.id
  depends_on = [module.instance]
}