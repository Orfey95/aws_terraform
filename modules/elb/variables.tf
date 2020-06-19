variable "name" {
  description = "Name of load balancer"
  type = string
}
variable "subnets" {
  description = "Subnets of load balancer"
  type = list(string)
}
variable "listener_instance_port" {
  description = "The port on the instance to route to"
  type = string
}
variable "listener_instance_protocol" {
  description = "The protocol to use to the instance"
  type = string
}
variable "listener_lb_port" {
  description = "The port to listen on for the load balancer"
  type = string
}
variable "listener_lb_protocol" {
  description = "The protocol to listen on"
  type = string
}
variable "instances" {
  description = "A list of instance ids to place in the ELB pool"
  type = list(string)
}
variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  type = bool
  default = false
}
variable "tags_name" {
  description = "Name tag of load balancer"
  type = string
}