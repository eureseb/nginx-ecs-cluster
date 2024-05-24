variable "aws_region" {
  type    = string
  default =  "ap-southeast-1"
}

variable "profile" {
  description = "The AWS profile used for this project"
  type  = string
}

variable "account_id" {
  description = "The account ID for the AWS account, used for S3 Bucket Policy"
  type = number
}
variable "service_name" {
  description = "The name of the ECS Service"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket that will be used for storing ALB Access Logs"
  type        = string
}

variable "elb-account-id" {
  description = "Used for creating the S3 Bucket policy."
  type = number
  default = 114774131450 # For ap-southeast-1 (Singapore)
}

variable "retention_in_days" {
  type  = number
  default = 90
}

variable "container_port" {
  type  = number
  default = 90
}

variable "desired_count" {
  type    = number
  default = 4
}

variable "launch_type" {
  type  = string
  default = "FARGATE"
}

variable "ecr_image_uri" {
  type  = string
  default = "dmartinezlchka/nginx-host:latest"
}

variable "task_cpu" {
  type  = number
  default = 512
}

variable "task_memory" {
  type  = number
  default = 1024
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to use for the subnets"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}