include {
  path = find_in_parent_folders()
}

dependency "alb" {
  config_path = "${get_parent_terragrunt_dir()}/resources/ec2/alb"
  mock_outputs = {
    dnsalb = "abcde-12345678.sdfdsfd.alb.amazonaws.com"
  }
  skip_outputs = false
}

inputs = {
  dnsalb = dependency.alb.outputs.alb_dns
}