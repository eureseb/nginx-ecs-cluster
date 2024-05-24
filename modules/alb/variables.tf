variable "service_name" {
    type = string
}

variable "bucket_name" {
    type = string
}
variable "container_port" {
    type = number
}

variable "sg_lb_id" {
    type = string
}

variable "public_subnet_a_id" {
    type = string
}

variable "public_subnet_b_id" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "elb-account-id" {
    type = number
}

variable "account_id" {
    type = number
}