variable "name" {
  description = "Name of DB subnet group"
  type = string
}
variable "subnet_ids" {
  description = "Subnet ids of DB subnet group"
  type = list(string)
}
variable "tags_name" {
  description = "Name tag of DB subnet group"
  type = string
}