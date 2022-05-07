locals {
  common_vars = read_terragrunt_config("${get_parent_terragrunt_dir()}/common/common.tf")
}

inputs = {
  GLOBAL_PROJECT_VARS = local.common_vars.locals
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
# variable "workspace_iam_roles" {
#   description = "Variable for credentials management."
#   default = {
#     craldo = "craldo"
#   }
# }
provider "aws" {
  region  = "us-east-1"
  profile = "craldo"
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket               = local.common_vars.locals.bucket_backend_name
    profile              = local.common_vars.locals.bucket_backend_profile
    region               = local.common_vars.locals.aws_region
    # workspace_key_prefix = "${local.common_vars.locals.bucket_proyect_folder}/${path_relative_to_include()}"
    key                  = "${local.common_vars.locals.bucket_proyect_folder}/${path_relative_to_include()}/${local.common_vars.locals.bucket_backend_key}"
    encrypt              = local.common_vars.locals.bucket_backend_encrypt
  }
}