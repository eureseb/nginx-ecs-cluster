
## Output the ALB DNS (A Record)

output "lb_dns" {
  value = module.alb.load_balancer_dns
}