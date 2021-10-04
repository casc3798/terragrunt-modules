resource "aws_ecs_service" "ecs_service" {
  name          = "${var.microservice_name}-${var.environment}-ms"
  cluster       = var.cluster_arn
  desired_count = var.desired_count
  launch_type   = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn
    container_name   = "${var.microservice_name}-${var.environment}-ms"
    container_port   = var.container_port
  }
  network_configuration {
    subnets          = var.subnets
    security_groups  = [aws_security_group.ms_security_group.id]
    assign_public_ip = true
  }
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  depends_on = [
    aws_security_group.ms_security_group
  ]

}