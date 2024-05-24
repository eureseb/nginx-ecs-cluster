

output "task_iam_role_arn" {
    value = aws_iam_role.task_iam_role.arn
}

output "task_role_arn" {
    value = aws_iam_role.task_role.arn
}