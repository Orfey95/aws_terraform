variable "cidr_block" {
  description = "CIDR of vpc"
  type = string
}
variable "instance_tenancy" {
  description = "Tenancy of vpc"
  type = string
  default = "default"
}
variable "tags_name" {
  description = "Name tag of vpc"
  type = string
}