module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = var.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      description = "user service"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      description = "ssh admin"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}