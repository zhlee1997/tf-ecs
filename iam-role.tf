resource "aws_iam_role" "iam-role" {
  name               = "ecsFargateTaskExecutionRole"
  assume_role_policy = file("${path.module}/iam-role.json")

  tags = {
    Name = "ecsFargateTaskExecutionRole"
  }

}
