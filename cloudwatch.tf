resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/springboot-service"
  retention_in_days = 7

  tags = {
    Name = "springboot-service-log-group"
  }
}
