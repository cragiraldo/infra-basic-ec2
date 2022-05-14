module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "basic-ec2-key-pair"
  public_key = file("~/.ssh/id_rsa_lf.pub")

}