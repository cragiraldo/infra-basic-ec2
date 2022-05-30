include {
  path = find_in_parent_folders()
}
dependency "vpc" {
  config_path = "${get_parent_terragrunt_dir()}/resources/network/vpc"
  mock_outputs = {
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
    instance_sg = "instance_sg_output_mock"
  }
  skip_outputs = false
}

dependency "key_pair" {
  config_path = "${get_parent_terragrunt_dir()}/resources/ec2/key-pair"
  mock_outputs = {
    key_name_basic = "key_name_output_mock"
  }
  skip_outputs = false
}

inputs = {
  key_name_basic = dependency.key_pair.outputs.keypair
  subnet_public = dependency.vpc.outputs.subnet_ids
  instance_sg = dependency.sg.outputs.sg_id
}