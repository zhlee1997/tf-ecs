resource "aws_service_discovery_private_dns_namespace" "ecs_dns_namespace" {
  name        = "services.local"
  description = "Private DNS namespace for ECS services"
  vpc         = aws_vpc.vpc.id

  tags = {
    Name = "services.local"
  }

}

resource "aws_service_discovery_service" "ecs_service_discovery" {
  name         = "service-registry"
  namespace_id = aws_service_discovery_private_dns_namespace.ecs_dns_namespace.id

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.ecs_dns_namespace.id
    dns_records {
      type = "A"
      ttl  = 10
    }
    routing_policy = "MULTIVALUE"
  }
}
