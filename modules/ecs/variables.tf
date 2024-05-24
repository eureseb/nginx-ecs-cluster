variable "aws_region" {
    type    = string
}

variable "service_name" {
    type    = string
}

variable "desired_count" {
    type    = number
}

variable "launch_type" {
    type    = string
}

variable "ecr_image_uri" {
    type    = string
}

variable "task_cpu" {
    type    = number
}

variable "task_memory" {
    type    = number
}

variable "container_port" {
    type    = number
}

variable "task_role_arn" {
    type    = string
}

variable "task_iam_role_arn" {
    type    = string
}

variable "aws_cloudwatch_lg_name" {
    type    = string
}

variable "private_subnet_a_id" {
    type    = string
}

variable "private_subnet_b_id" {
    type    = string
}

variable "sg_ecs_id" {
    type    = string
}

variable "alb_target_group_arn" {
    type    = string
}

variable "lb_listener" {
    type    = any
}