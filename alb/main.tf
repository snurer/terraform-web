########## Target Group ###########

resource "aws_lb_target_group" "main" {
  name     = replace(local.name, "rtype", "main-tg")
  port     = var.app_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.custom_vpc.id
  health_check {
    path = "/"
    port = var.app_port #better to give local because it's not gonna change
  }
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "main-tg")
    }
  )
}

######## Application Load Balancer #########

resource "aws_lb" "main" {
  name               = replace(local.name, "rtype", "alb")
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = var.subnets

  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "alb")
    }
  )
}

################ ALB - Listener Rule ###############
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

############### Auto Scaling Attachment ###########
resource "aws_autoscaling_attachment" "asg_alb_attachment" {
  autoscaling_group_name = data.aws_autoscaling_group.dev_asg.id
  lb_target_group_arn    = aws_lb_target_group.main.arn
}