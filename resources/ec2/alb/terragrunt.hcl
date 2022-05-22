include {
  path = find_in_parent_folders()
}
dependency "vpc" {
  config_path = "${get_parent_terragrunt_dir()}/resources/network/vpc"
  mock_outputs = {
    vpc_id = "vpc-12345678"
    subnet_public = [
      "subnet1_output_mock",
      "subnet2_output_mock"
      ]
  }
  skip_outputs = false
}

dependency "sg" {
  config_path = "${get_parent_terragrunt_dir()}/resources/ec2/security-group"
  mock_outputs = {
    sg_alb_id = "sg_alb_output_mock"
  }
  skip_outputs = false
}

dependency "instance" {
  config_path = "${get_parent_terragrunt_dir()}/resources/ec2/instance"
  mock_outputs = {
    instance_id = "instance_id_output_mock"
  }
  skip_outputs = false
}


inputs = {
  subnet_public = dependency.vpc.outputs.subnet_ids{[0],[1]}
  instance_sg = dependency.sg.outputs.sg_id
  sg_alb_id = dependency.sg.outputs.sg_alb_id
  instance_id =  dependency.instance.outputs.instance_id
  vpc_id = dependency.vpc.outputs.vpc_id
}