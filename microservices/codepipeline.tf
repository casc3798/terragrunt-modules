resource "aws_codepipeline" "codepipeline_project" {
  name     = "${var.microservice_name}-${var.environment}-ms"
  role_arn = aws_iam_role.ms_cp_role.arn
  artifact_store {
    location = var.codepipeline_artifact_store
    type     = "S3"
  }
  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.codepipeline_connection_arn
        FullRepositoryId = var.codepipeline_full_repository_id
        BranchName       = var.codepipeline_branch
      }
    }
  }
  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.codebuild_project.id
      }
    }

  }
  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      version         = "1"
      input_artifacts = ["build_output"]

      configuration = {
        ClusterName = var.cluster_arn
        ServiceName = aws_ecs_service.ecs_service.name
      }
    }

  }
  tags = {
    Name        = "${var.microservice_name}-${var.environment}"
    Project     = "${var.project}"
    Environment = "${var.environment}"
    Description = "${var.description}"
  }
  depends_on = [
    aws_iam_role.ms_cp_role
  ]
}