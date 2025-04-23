resource "aws_ecs_task_definition" "TD" {
  family                   = "nginx"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.iam-role.arn
  cpu                      = 1024
  memory                   = 2048

  container_definitions = jsonencode([
    {
      name = "main-container"
      # TODO: ECR Image
      image     = "nginx:latest"
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    }
  ])

  tags = {
    Name = "my-task"
  }

}

# data "aws_ecs_task_definition" "TD" {
#   task_definition = aws_ecs_task_definition.TD.family
# }
