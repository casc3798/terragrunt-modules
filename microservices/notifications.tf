resource "aws_codestarnotifications_notification_rule" "notification_on_deploy_state" {
  detail_type    = var.notification_detail
  event_type_ids = ["codepipeline-pipeline-pipeline-execution-failed", "codepipeline-pipeline-pipeline-execution-started", "codepipeline-pipeline-pipeline-execution-succeeded", "codepipeline-pipeline-pipeline-execution-canceled", "codepipeline-pipeline-pipeline-execution-resumed", "codepipeline-pipeline-pipeline-execution-superseded"]

  name     = "${var.microservice_name}-${var.environment}-deploy-notifications"
  resource = aws_codepipeline.codepipeline_project.arn

  target {
    address = var.sns_topic_arn
  }
}