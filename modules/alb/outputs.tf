## Output the ALB DNS name to access

output "load_balancer_dns" {
  value = aws_lb.ecs_cluster_alb.dns_name
}

output "alb_target_group_arn" {
  value = aws_lb_target_group.lb_target_group.arn
}

output "lb_listener" {
  value = aws_lb_listener.lb_listener
}