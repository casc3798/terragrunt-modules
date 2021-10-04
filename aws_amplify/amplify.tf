resource "aws_amplify_app" "app" {
    name = var.name
    repository = var.repository
    build_spec = var.build_spec
    environment_variables = var.environment_variables
    access_token = var.access_token
    enable_branch_auto_build = var.enable_branch_auto_build
    enable_branch_auto_deletion = var.enable_branch_auto_deletion
    platform = var.platform

    description = var.description
}