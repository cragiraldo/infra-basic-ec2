output "sg_id" {
  description = "The ID of the Security Group"
  value       = module.web_server_sg.security_group_id
}