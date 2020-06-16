variable "ami" {
  description = "Ami of vm instance"
  type = string
}
variable "instance_type" {
  description = "Type of vm instance"
  type = string
}
variable "vpc_security_group_ids" {
  description = "Security group of vm instance"
  type = list(string)
}
variable "key_name" {
  description = "The key name to use for the instance"
  type = string
}
variable "tags_name" {
  description = "Tags of vm instance"
  type = string
}
