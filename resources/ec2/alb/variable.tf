variable "subnet_public" {
    description = "Subnet for public network"
    type = list
    default = null
}

variable "sg_alb_id" {
    description = "Security group for instances"
    default = null
}

variable "instance_id" {
    description = "Key name for basic ec2 instance"
    default = null
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = null
}