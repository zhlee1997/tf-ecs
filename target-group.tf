resource "aws_alb_target_group" "TG" {
  name        = "my-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id

  #   health_check {
  #     path                = "/"
  #     interval            = 30
  #     timeout             = 5
  #     healthy_threshold   = 2
  #     unhealthy_threshold = 2
  #   }

  tags = {
    Name = "my-target-group"
  }

}

resource "aws_alb_target_group" "springboot_tg" {
  name        = "springboot-tg"
  port        = 8761
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id
}
