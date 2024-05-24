resource "aws_security_group" "sg_lb" {
    vpc_id = aws_vpc.main.id
  
    ingress {
        description = "Allow all inbound HTTP traffic"
        from_port   = var.container_port
        to_port     = var.container_port
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "sg_ecs" {
  vpc_id = aws_vpc.main.id

  ingress {
    description = "Allow only inbound HTTP traffic from ALB"
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    = "tcp"
    security_groups  = [aws_security_group.sg_lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}