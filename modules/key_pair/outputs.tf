output "key_pair_id" {
  value = aws_key_pair.aws_key_pair.key_name
  depends_on = [module.instance]
}