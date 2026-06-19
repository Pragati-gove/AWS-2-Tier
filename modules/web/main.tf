resource "aws_lb" "web" {
  name               = "${var.project}-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups    = [var.alb_sg_id]
  tags = {
    Name = "${var.project}-alb"
  }

}

resource "aws_lb_target_group" "web" {
  name     = "${var.project}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/health"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }

}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }

}

resource "aws_launch_template" "web" {
  name_prefix   = "${var.project}-web-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.web_ec2_sg_id]
  }

  user_data = base64encode(<<-EOF
#!/bin/bash
yum update -y
yum install -y nginx

echo "healthy" > /usr/share/nginx/html/health

systemctl enable nginx
systemctl start nginx
EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.project}-web-ec2"
    }
  }
}

resource "aws_autoscaling_group" "web" {
  name                = "${var.project}-web-asg"
  vpc_zone_identifier = var.public_subnet_ids
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2
  target_group_arns   = [aws_lb_target_group.web.arn]
  health_check_type   = "ELB"

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

}

resource "aws_autoscaling_policy" "cpu" {
  name                   = "${var.project}-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.web.name
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 60.0
  }




}