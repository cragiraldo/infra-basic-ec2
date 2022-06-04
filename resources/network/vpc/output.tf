output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}
output "vpc_name" {
  description = "The name of the VPC"
  value       = module.vpc.name
}
output "subnet_ids" {
  description = "The ID of the subnets"
  value       = module.vpc.public_subnets
}