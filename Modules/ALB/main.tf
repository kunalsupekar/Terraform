resource "aws_lb" "this" {
  name               = var.lb_name
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [var.lb_sg_id]

  tags = {
    Name = var.lb_name
  }
}

resource "aws_lb_target_group" "this" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/"
  }

  tags = {
    Name = var.tg_name
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
