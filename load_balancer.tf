resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_fe.id, aws_security_group.security_be.id]
  subnets            = [aws_subnet.public_subnets[0].id, aws_subnet.public_subnets[1].id]

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "be_tg" {
  name     = "target-group-be"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_target_group" "fe_tg" {
  name     = "target-group-fe"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_target_group_attachment" "tg_attachment_be" {
  target_group_arn = aws_lb_target_group.be_tg.arn
  target_id        = aws_instance.server_BE.id
  port             = 8080
}

resource "aws_lb_target_group_attachment" "tg_attachment_fe" {
  target_group_arn = aws_lb_target_group.fe_tg.arn
  target_id        = aws_instance.server_FE.id
  port             = 80
}

resource "aws_lb_listener" "my_alb_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fe_tg.arn
  }
}

resource "aws_lb_listener_rule" "api_rule" {
  listener_arn = aws_lb_listener.my_alb_listener.arn
  priority     = 60

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.be_tg.arn
  }

  condition {
    path_pattern {
      values = ["/api*"]
    }
  }
}
