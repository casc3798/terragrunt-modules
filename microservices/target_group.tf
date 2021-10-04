resource "aws_lb_target_group" "target_group" {
  name        = "${var.microservice_name}-${var.environment}-ms"
  port        = var.host_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  health_check {
    matcher             = "200,400,404"
    path                = "/"
    port                = var.host_port
    unhealthy_threshold = 6
  }
}