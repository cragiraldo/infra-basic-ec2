module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "basic-alb"

  load_balancer_type = "application"


  vpc_id             = var.vpc_id
  subnets            = [var.subnet_public[0],var.subnet_public[1]]
  security_groups    = [var.sg_alb_id]
  internal = false

  target_groups = [
    {
      name_prefix      = "tg-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = var.instance_id
          port = 80
        }
      ]
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "basic-alb"
  }
}