variable "subnet_public" {
    description = "Subnet for public network"
    type = list
    default = null
}

variable "instance_sg" {
    description = "Security group for instances"
    default = null
}

variable "key_name_basic" {
    description = "Key name for basic ec2 instance"
    default = null
}