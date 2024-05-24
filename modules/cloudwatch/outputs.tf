

output "aws_cloudwatch_lg_name" {
    value = aws_cloudwatch_log_group.ecs_task_log_group.name
}