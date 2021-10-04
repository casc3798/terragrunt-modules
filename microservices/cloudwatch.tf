resource "aws_cloudwatch_log_group" "log_group" {
  name = "${var.microservice_name}-${var.environment}-ms"
  tags = {
    "Name"        = "${var.microservice_name}-${var.environment}"
    "Project"    = "${var.project}"
    "Environment" = "${var.environment}"
    "Description" = "${var.description}"
  }
}