
## Application Load Balancer

resource "aws_lb" "ecs_cluster_alb" {
  name               = "${var.service_name}-v1-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_lb_id]
  subnets            = [var.public_subnet_a_id, var.public_subnet_b_id]

  # Access Logging Configuration
  access_logs {
    bucket = aws_s3_bucket.alb_access_logs.bucket
    enabled = true
  }


  tags = {
    Name = "Application Load Balancer for Nginx Cluster"
  }
}

## ALB Target Group

resource "aws_lb_target_group" "lb_target_group" {
  name       = "load-balancer-tg"
  port       = var.container_port
  protocol   = "HTTP"
  target_type = "ip"
  vpc_id     = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
  
}

## ALB Listener

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.ecs_cluster_alb.arn
  port              = var.container_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}


## S3 Bucket for ALB Access Logs

resource "aws_s3_bucket" "alb_access_logs" {
  bucket = "${var.bucket_name}-logs"
}

resource "aws_s3_bucket_policy" "alb_logs_policy" {
  bucket = aws_s3_bucket.alb_access_logs.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${var.elb-account-id}:root"
        },
        Action = "s3:PutObject",
        Resource = "${aws_s3_bucket.alb_access_logs.arn}/AWSLogs/${var.account_id}/*"
      }
    ]
  })
}