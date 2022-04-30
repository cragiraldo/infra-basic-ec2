include {
  path = find_in_parent_folders()
}
dependency "vpc" {
  config_path = "${get_parent_terragrunt_dir()}/resources/network/vpc"
  mock_outputs = {
    vpc_idvpc_id = "vpc_mock_outputs"
  }
  skip_outputs = false
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
}