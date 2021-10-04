variable "name" {
    description = "Name of the amplify application"
}

variable "description" {
    description = "Description of the amplify application"
}

variable "build_spec" {
    description = "Build specification for the amplify application"
}

variable "enable_branch_auto_build" {
    description = "Enables auto-building of branches for the Amplify Application"
}

variable "enable_branch_auto_deletion" {
    description = "Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository"
}

variable "environment_variables" {
    description = "Environment variables for the Amplify Application"
    type = map(string)
}

variable "repository" {
    description = "Repository for the Amplify Application"
}

variable "platform" {
    description = "Platform or framework fo the Amplify application"
}

variable "access_token" {
    description = "access_token token from the third-party source control system"
}