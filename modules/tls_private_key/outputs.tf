output "public_key_openssh" {
  value = tls_private_key.tls_private_key.public_key_openssh
  depends_on = [module.key_pair]
}
output "private_key_pem" {
  value = tls_private_key.tls_private_key.private_key_pem
}