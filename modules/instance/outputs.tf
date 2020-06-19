output "instance_id" {
  value = aws_instance.aws_instance.id
  depends_on = [module.elb]
}