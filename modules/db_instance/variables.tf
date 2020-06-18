variable "allocated_storage" {
  description = "Size of storage"
  type = string
  default = "20"
}
variable "storage_type" {
  description = "Type of storage"
  type = string
}
variable "engine" {
  description = "Type of DB"
  type = string
}
variable "engine_version" {
  description = "Version of DB"
  type = string
}
variable "instance_class" {
  description = "Instance class of DB"
  type = string
}
variable "name" {
  description = "Name of DB"
  type = string
}
variable "username" {
  description = "Username of user of DB"
  type = string
}
variable "password" {
  description = "Password of user of DB"
  type = string
}
variable "parameter_group_name" {
  description = "Name of DB parameter group to associate"
  type = string
}
variable "db_subnet_group_name" {
  description = "Name of DB subnet group"
  type = string
}
variable "identifier" {
  description = "Name of DB instance"
  type = string
}
variable "skip_final_snapshot" {
  description = "Name tag of DB"
  type = bool
  default = true
}
variable "tags_name" {
  description = "Name tag of DB"
  type = string
}