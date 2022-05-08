variable "subnet_public" {
    description = "Subnet for public network"
    default = []
}

variable "instance_sg" {
    description = "Security group for instances"
    default = null
}
