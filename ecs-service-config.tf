resource "aws_ecs_service" "ecs_service_api_config_service" {
  name                               = "config-service"
  cluster                            = aws_ecs_cluster.ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.config_service_td.arn
  scheduling_strategy                = "REPLICA"
  desired_count                      = 1
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  depends_on = [aws_alb_listener.listener_8888, aws_iam_role.iam-role]

  launch_type = "FARGATE"

  platform_version = "LATEST"

  load_balancer {
    target_group_arn = aws_alb_target_group.config_service_tg.arn
    container_name   = "config-service-container"
    container_port   = 8888
  }

  network_configuration {
    subnets          = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
    security_groups  = [aws_security_group.SG.id]
    assign_public_ip = true
  }

  tags = {
    Name = "config-service"
  }

}
