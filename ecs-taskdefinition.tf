resource "aws_ecs_task_definition" "TD" {
  # family                   = "nginx"
  family                   = "springboot-service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.iam-role.arn
  cpu                      = 1024
  memory                   = 2048

  container_definitions = jsonencode([
    {
      name      = "main-container"
      image     = "nginx:latest"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    },
    {
      name      = "springboot-container"
      image     = "565428532910.dkr.ecr.us-east-1.amazonaws.com/leezonghan19/link-app:latest"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = 8761
          hostPort      = 8761
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/springboot-service"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])

  tags = {
    Name = "my-task"
  }

}

# data "aws_ecs_task_definition" "TD" {
#   task_definition = aws_ecs_task_definition.TD.family
# }
