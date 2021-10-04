resource "aws_lb" "lb" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [var.security_group]
  subnets            = var.subnets

  enable_deletion_protection = false

  tags = {
    "Name"    = "${var.lb_name}"
    "Project" = "${var.project}"
  }
}
