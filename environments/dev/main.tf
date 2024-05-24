provider "aws" {
    profile = var.profile
    region = var.aws_region
}

## Modules

module "alb" {
  source = "../../modules/alb"
  container_port = var.container_port
  service_name = var.service_name
  sg_lb_id = module.vpc.sg_lb_id
  public_subnet_a_id = module.vpc.public_subnet_a_id
  public_subnet_b_id = module.vpc.public_subnet_b_id
  vpc_id = module.vpc.vpc_id
  bucket_name = var.bucket_name
  elb-account-id = var.elb-account-id
  account_id = var.account_id
}

module "cloudwatch" {
    source = "../../modules/cloudwatch"
    service_name = var.service_name
    aws_region = var.aws_region
}

module "ecs" {
  source = "../../modules/ecs"
  service_name = var.service_name
  ecr_image_uri = var.ecr_image_uri
  aws_region = var.aws_region
  task_cpu = var.task_cpu
  task_memory = var.task_memory
  desired_count = var.desired_count
  launch_type = var.launch_type
  container_port = var.container_port
  task_iam_role_arn = module.iam.task_iam_role_arn
  task_role_arn = module.iam.task_role_arn
  aws_cloudwatch_lg_name = module.cloudwatch.aws_cloudwatch_lg_name
  private_subnet_a_id = module.vpc.private_subnet_a_id
  private_subnet_b_id = module.vpc.private_subnet_b_id
  sg_ecs_id = module.vpc.sg_ecs_id
  alb_target_group_arn = module.alb.alb_target_group_arn
  lb_listener = module.alb.lb_listener
}

module "iam" {
  source = "../../modules/iam"
  service_name = var.service_name
  aws_region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"
  container_port = var.container_port
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs[*]
  private_subnet_cidrs = var.private_subnet_cidrs[*]
  availability_zones = var.availability_zones[*]
}

