variable "microservice_name" {
    description = "Name of the microservice (without -ms suffix)"
}

variable "environment" {
    description = "Environment for deployment. e.g Production, Testing"
}

variable "task_cpu" {
    description = "Whole CPU for the ECS task"
    type = number
}

variable "task_memory" {
    description = "The amount (in MiB) of memory to present to the container. If the container attempts to exceed the memory specified here, the container is killed "
    type = number
}

variable "task_memory_reservation" {
    description = "The soft limit (in MiB) of memory to reserve for the container. When system memory is under heavy contention, Docker attempts to keep the container memory to this soft limit"
    type = number
}

variable "container_port" {
    description = "Container port to be mapped to host port"
    type = number
}

variable "host_port" {
    description = "Host port mapped from container port"
    type = number
}

variable "environment_variables" {
    description = "Environment variables passed to the container"
    type = list(object({
                name = string
                value = string
            }))
}

variable "cluster_arn" {
    description = "ARN of the ECS cluster where this microservice is going to be placed"
}

variable "desired_count" {
    description = "Desired number of running instances for this microservice"
    type = number
}

variable "subnets" {
    description = "Private subnets for the environment"
    type = list(string)
}

variable "vpc_id" {
    description = "Environment VPC"
}

variable "lb_listener_arn" {
    description = "Load balancer listener arn"
}

variable "route_pattern" {
    description = "Array of route patterns to be redirected from the load balancer to this microservice"
    type = list(string)
}

variable "codebuild_compute_type" {
    description = "Compute type for the build stage, this specifies the computing resources needed for the build of the microservice image"
}

variable "codebuild_source_type" {
    description = "Source type for the CodeBuild project, e.g BITBUCKET or GITHUB"
}

variable "codebuild_source_location" {
    description = "Repository URL for the CodeBuild project. This should have the environment too, e.g. putting the url for the development branch"
}

variable "buildspec_path" {
    description = "Path for the buildspec.yml file in the repository"
}

variable "codepipeline_artifact_store" {
    description = "Path for the codepipeline artifact store, usually a s3 bucket"
}

variable "codepipeline_connection_arn" {
    description = "ARN for the codepipeline repository connection"
}

variable "codepipeline_full_repository_id" {
    description = "Repository id inside the source, e.g. team-tech/my-repository"
}

variable "codepipeline_branch" {
    description = "Branch to be deployed on the codepipeline service"
}

variable "aws_region" {
    description = "Region where the microservice will be deployed"
}

variable "project" {
    description = "Name of the project of this microservice"
}

variable "description" {
    description = "Description of the microservice"
}

variable "notification_detail" {
    description = "Notification detail when the CodePipeline pipeline is successfully deployed (or not)"
}

variable "sns_topic_arn" {
    description = "ARN of the SNS topic used to notify on CodePipeline deployments"
}

variable "cb_security_group_ids" {
    description = "Security groups for codebuild project"
    type = list(string)
    default = []
}