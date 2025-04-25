resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/springboot-service"
  retention_in_days = 7

  tags = {
    Name = "springboot-service-log-group"
  }
}

resource "aws_cloudwatch_log_group" "ecs_log_group_api_gateway" {
  name              = "/ecs/api-gateway"
  retention_in_days = 7

  tags = {
    Name = "api-gateway-log-group"
  }
}

resource "aws_cloudwatch_log_group" "ecs_log_group_config_service" {
  name              = "/ecs/config-service"
  retention_in_days = 7

  tags = {
    Name = "config-service-log-group"
  }
}

