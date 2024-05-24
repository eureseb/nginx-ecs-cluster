## ECS Cluster

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.service_name}"

  tags = {
    Name = "ECS Cluster"
  }
}


## ECS Service with Load Balancer

resource "aws_ecs_service" "ecs_service" {
    name            = "${var.service_name}-service"
    cluster         = aws_ecs_cluster.ecs_cluster.id
    task_definition = aws_ecs_task_definition.ecs_task_definition.arn
    desired_count   = var.desired_count
    launch_type     = var.launch_type

    network_configuration {
      subnets         = [var.private_subnet_a_id, var.private_subnet_a_id]
      security_groups = [var.sg_ecs_id] //aws_security_group.sg_ecs.id
      assign_public_ip = false
    }

    load_balancer {
      target_group_arn = var.alb_target_group_arn // aws_lb_target_group.lb_target_group.arn
      container_name   = "nginx-dmartinezlchka"
      container_port   = var.container_port
    }

    force_new_deployment = true

    depends_on = [
      var.lb_listener // aws_lb_listener.lb_listener
    ]

    tags = {
      Name = "ECS Service"
    }
}

## ECS Task Definition for Nginx with logs

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "${var.service_name}-${var.aws_region}-v1-container"
  network_mode             = "awsvpc"
  requires_compatibilities = [var.launch_type]
  execution_role_arn       = var.task_iam_role_arn # aws_iam_role.task_iam_role.arn
  task_role_arn = var.task_role_arn
  cpu    = var.task_cpu
  memory = var.task_memory

  container_definitions = jsonencode([{
    name  = "nginx-dmartinezlchka"
    image = var.ecr_image_uri
    cpu    = var.task_cpu
    memory = var.task_memory
    essential = true
    portMappings  = [{
      containerPort = var.container_port
      protocol      = "tcp"
    }]

    logConfiguration = {
      logDriver = "awslogs"
      options    = {
        "awslogs-group" = var.aws_cloudwatch_lg_name # aws_cloudwatch_log_group.ecs_task_log_group.name
        "awslogs-region" = var.aws_region
        "awslogs-stream-prefix" = "ecs"
      }
    }

    healthCheck = {
      command     = ["CMD-SHELL", "curl -f http://localhost:${var.container_port}/ || exit 1"]
      interval    = 30
      timeout     = 5
      retries     = 3
      startPeriod = 60
    }
  }])

  runtime_platform {
    cpu_architecture        = "ARM64"
    operating_system_family = "LINUX"
   }

   tags = {
    Name = "Nginx Task Definition for ARM64"
   }
}
