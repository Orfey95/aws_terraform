resource "aws_elb" "aws_elb" {
  name               = var.name
  subnets            = var.subnets

  listener {
    instance_port     = var.listener_instance_port
    instance_protocol = var.listener_instance_protocol
    lb_port           = var.listener_lb_port
    lb_protocol       = var.listener_lb_protocol
  }

  instances                   = var.instances
  cross_zone_load_balancing   = var.cross_zone_load_balancing

  tags = {
    Name = var.tags_name
  }
}