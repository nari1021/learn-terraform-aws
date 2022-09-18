resource "aws_lb" "main" {
  name                       = "${local.resource_prefix}-alb-${local.resource_suffix}"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb.id]
  subnets                    = [for subnet in aws_subnet.main : subnet.id]
  enable_deletion_protection = false

  tags = {
    Name = "${local.resource_prefix}-alb-${local.resource_suffix}"
  }
}
