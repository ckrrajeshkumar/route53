resource "aws_elb" "babaji-elb" {
  security_groups = [var.sg_id]
  subnets = var.subnet_ids
  listener {
    instance_port     = "80"
    instance_protocol = "http"
    lb_port           = "80"
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    interval            = 30
    target              = "http:80/index.html"
    timeout             = 3
    unhealthy_threshold = 2
  }
  instances = var.instance_ids
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300
  tags = {
    Name = var.elbname
  }
}
output "elb" {
  value = aws_elb.babaji-elb.dns_name
}