resource "aws_codebuild_project" "codebuild_project" {
  name         = "${var.microservice_name}-${var.environment}-ms"
  description  = "Automatic build for the ${var.microservice_name} microservice"
  service_role = aws_iam_role.ms_cb_role.arn
  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type    = var.codebuild_compute_type
    image           = "aws/codebuild/standard:5.0"
    privileged_mode = true
    type            = "LINUX_CONTAINER"
  }
  source {
    type                = var.codebuild_source_type
    report_build_status = true
    location            = var.codebuild_source_location
    buildspec           = var.buildspec_path
  }
  
  vpc_config {
    vpc_id = var.vpc_id
    subnets = var.subnets
    security_group_ids = var.cb_security_group_ids
  }

  depends_on = [
    aws_iam_role.ms_cb_role
  ]
}