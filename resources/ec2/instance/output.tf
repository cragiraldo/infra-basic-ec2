output "instance_ip_public" {
    description = "Public IP address of the instance"
    value = module.ec2_instance.public_ip
}

output "instance_id" {
    description = "ID of the instance"
    value = module.ec2_instance.id
}