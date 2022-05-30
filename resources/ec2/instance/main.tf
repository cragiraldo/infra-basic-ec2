module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "instance_app"

  ami                    = "ami-005de95e8ff495156"
  instance_type          = "t2.micro"
  key_name               = var.key_name_basic
  monitoring             = false
  vpc_security_group_ids = [var.instance_sg]
  subnet_id              = var.subnet_public[0]
  user_data = file("userdata.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}