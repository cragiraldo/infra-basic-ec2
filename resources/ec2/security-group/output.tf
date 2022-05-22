output "sg_id" {
  description = "The ID of the Security Group"
  value       = module.web_server_sg.security_group_id
}
output "sg_alb_id" {
  description = "The ID of the Security Group for ALB"
  value       = module.alb_sg.security_group_id
}
