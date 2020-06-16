variable "name" {
  description = "Name of security group"
  type = string
}
variable "description" {
  description = "Description of security group"
  type = string
}
// Ingress
variable "ingress_description" {
  description = "Description of ingress rule for security group"
  type = string
}
variable "ingress_from_port" {
  description = "From port of ingress rule for security group"
  type = string
}
variable "ingress_to_port" {
  description = "To port of ingress rule for security group"
  type = string
}
variable "ingress_protocol" {
  description = "Protocol of ingress rule for security group"
  type = string
}
variable "ingress_cidr_blocks" {
  description = "CIDR of ingress rule for security group"
  type = list(string)
}
// Egress
variable "egress_description" {
  description = "Description of egress rule for security group"
  type = string
}
variable "egress_from_port" {
  description = "From port of egress rule for security group"
  type = string
}
variable "egress_to_port" {
  description = "To port of egress rule for security group"
  type = string
}
variable "egress_protocol" {
  description = "Protocol of egress rule for security group"
  type = string
}
variable "egress_cidr_blocks" {
  description = "CIDR of egress rule for security group"
  type = list(string)
}
variable "tags_name" {
  description = "Tags of vm instance"
  type = string
}