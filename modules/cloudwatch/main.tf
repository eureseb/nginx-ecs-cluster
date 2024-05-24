## CloudWatch Log Group for ECS Service Tasks

resource "aws_cloudwatch_log_group" "ecs_task_log_group" {
  name              = "${var.service_name}-${var.aws_region}-tasks-lg"
  retention_in_days = var.retention_in_days

  tags = {
    Name = "ECS Tasks Log Group"
  }
}