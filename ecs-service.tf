resource "aws_ecs_service" "ecs_service" {
  name                               = "my-service"
  cluster                            = aws_ecs_cluster.ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.TD.arn
  scheduling_strategy                = "REPLICA"
  desired_count                      = 2
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  depends_on = [aws_alb_listener.Listener, aws_iam_role.iam-role]

  launch_type = "FARGATE"

  platform_version = "LATEST"

  load_balancer {
    target_group_arn = aws_alb_target_group.TG.arn
    container_name   = "main-container"
    container_port   = 80
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.springboot_tg.arn
    container_name   = "springboot-container"
    container_port   = 8761
  }

  network_configuration {
    subnets          = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
    security_groups  = [aws_security_group.SG.id]
    assign_public_ip = true
  }

  tags = {
    Name = "my-service"
  }

}
