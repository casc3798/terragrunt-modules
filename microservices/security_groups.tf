resource "aws_security_group" "ms_security_group" {
  name        = "${var.microservice_name}-${var.environment}-ms"
  description = "Allows tcp connections on ${var.container_port}"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}