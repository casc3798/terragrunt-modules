output "lb_https_listener_arn" {
  value = aws_lb_listener.https_lb_listener.arn
}

output "lb_http_listener_arn" {
  value = aws_lb_listener.http_lb_listener.arn
}