
resource "aws_lb_listener" "http_lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Please provide a request to a valid endpoint of the ${var.lb_name} load balancer"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener" "https_lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:637382923410:certificate/de7b228a-5087-4f89-9fa0-8cbce5e11ba4"
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Please provide a request to a valid endpoint of the load balancer"
      status_code  = "200"
    }
  }
}
