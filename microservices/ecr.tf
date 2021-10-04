resource "aws_ecr_repository" "ecr_repository" {
  name                 = "${var.microservice_name}-${var.environment}-ms"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    "Name"       = "${var.microservice_name}-${var.environment}"
    "Project"    = "${var.project}"
    "Environment" = "${var.environment}"
    "Description" = "${var.description}"
  }
}