resource "aws_lb_listener_rule" "ms_listener_rule" {
  listener_arn = var.lb_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }

  condition {
    path_pattern {
      values = var.route_pattern
    }
  }
}
