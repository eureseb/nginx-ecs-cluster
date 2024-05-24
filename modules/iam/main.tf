resource "aws_iam_role" "task_role" {
  name = "${var.service_name}-${var.aws_region}-ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role" "task_iam_role" {
    name = "${var.service_name}-${var.aws_region}-ecs"

    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [{
        Effect    = "Allow",
        Principal = {
            Service = "ecs-tasks.amazonaws.com"
        },
        Action = "sts:AssumeRole"
        }]
    })

    managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]

}