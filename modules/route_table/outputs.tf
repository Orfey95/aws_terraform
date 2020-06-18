output "route_table_id" {
  value = aws_route_table.aws_route_table.id
  depends_on = [module.instance]
}