output "vpc_id" {
  value = aws_vpc.aws_vpc.id
  depends_on = [module.instance]
}