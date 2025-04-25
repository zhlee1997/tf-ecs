resource "aws_ecs_task_definition" "api_gateway_td" {
  family                   = "api-gateway"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.iam-role.arn
  cpu                      = 1024
  memory                   = 2048

  container_definitions = jsonencode([
    {
      name = "api-gateway-container"
      // TDO: Update the image to your API Gateway image
      image     = ""
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 8765
          hostPort      = 8765
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "EUREKA_URL"
          value = "http://service-registry:8761/eureka"
        },
        {
          name  = "CONFIG_URL"
          value = "http://config-service:8888"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/api-gateway"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  tags = {
    Name = "api-gateway-task"
  }

}

# data "aws_ecs_task_definition" "TD" {
#   task_definition = aws_ecs_task_definition.TD.family
# }
