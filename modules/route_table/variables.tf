variable "vpc_id" {
  description = "VPC of route table"
  type = string
}
variable "cidr_block" {
  description = "CIDR of route table"
  type = string
}
variable "gateway_id" {
  description = "Gateway of route table"
  type = string
}
variable "tags_name" {
  description = "Name tag of route table"
  type = string
}