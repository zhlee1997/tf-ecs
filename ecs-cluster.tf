resource "aws_ecs_cluster" "ecs_cluster" {
  name = "my-cluster"

  tags = {
    Name = "my-cluster"
  }

}
