output "alb_dns" {
  description = "DNS name of the ALB"
  value = module.alb.lb_dns_name
}