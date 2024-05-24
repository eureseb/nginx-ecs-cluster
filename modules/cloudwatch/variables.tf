variable "aws_region" {
    type = string
}

variable "service_name" {
    type = string
}

variable "retention_in_days" {
    type    = number
    default = 90
}