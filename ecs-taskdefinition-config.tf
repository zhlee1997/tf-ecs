resource "aws_ecs_task_definition" "config_service_td" {
  family                   = "config-service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.iam-role.arn
  cpu                      = 1024
  memory                   = 2048

  container_definitions = jsonencode([
    {
      name = "config-service-container"
      // TDO: Update the image to your Config Service image
      image     = "565428532910.dkr.ecr.us-east-1.amazonaws.com/linkspark/config-service:latest"
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 8888
          hostPort      = 8888
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/config-service"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  tags = {
    Name = "config-service-task"
  }

}

# data "aws_ecs_task_definition" "TD" {
#   task_definition = aws_ecs_task_definition.TD.family
# }
