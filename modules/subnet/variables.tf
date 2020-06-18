variable "vpc_id" {
  description = "VPC of subnet"
  type = string
}
variable "cidr_block" {
  description = "CIDR of subnet"
  type = string
}
variable "availability_zone" {
  description = "Availability zone of subnet"
  type = string
}
variable "map_public_ip_on_launch" {
  description = "Assigned a public IP address to instance"
  type = bool
  default = false
}
variable "tags_name" {
  description = "Name tag of subnet"
  type = string
}