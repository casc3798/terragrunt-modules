resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "${var.microservice_name}-${var.environment}-ms"
  container_definitions    = jsonencode([
    {
      name  = "${var.microservice_name}-${var.environment}-ms"
      image = "${aws_ecr_repository.ecr_repository.repository_url}:latest"
      cpu   = var.task_cpu
      memory = var.task_memory
      memoryReservation = var.task_memory_reservation
      portMappings = [
        {
          containerPort = var.container_port
          hostPort = var.host_port
        }  
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group = "${aws_cloudwatch_log_group.log_group.name}"
          awslogs-region = "${var.aws_region}"
          awslogs-stream-prefix = "ecs"
        }
      }
      environment = "${var.environment_variables}"
    }
  ])
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  network_mode             = "awsvpc"
  execution_role_arn       = "arn:aws:iam::637382923410:role/ecsTaskExecutionRole"
  tags = {
    "Name"        = "${var.microservice_name}-${var.environment}"
    "Environment" = "${var.environment}"
    "Project"     = "${var.project}"
    "Description" = "${var.description}"
  }
  depends_on = [
    aws_cloudwatch_log_group.log_group
  ]
}