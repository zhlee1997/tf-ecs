resource "aws_alb" "alb" {
  name                       = "my-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.SG.id]
  subnets                    = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  drop_invalid_header_fields = true

  tags = {
    Name = "my-alb"
  }

}

resource "aws_alb_listener" "Listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.TG.id
  }

  tags = {
    Name = "my-alb-listener"
  }

}

resource "aws_alb_listener" "listener_8761" {
  load_balancer_arn = aws_alb.alb.arn
  port              = 8761
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.springboot_tg.arn
  }
}
