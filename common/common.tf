locals {
  ########################################
  ####### Configuracion del Backent ######
  ########################################

  aws_region = "us-east-1"
  bucket_backend_name = "backend-test-proyects"
  bucket_backend_profile = "craldo"
  bucket_backend_key = "terraform.tfstate"
  bucket_backend_encrypt = false
  bucket_proyect_folder = "infra-basic-alb" # Asignacion de ruta del proyecto sin "v/" al final.

  ########################################
  ###### Configuracion del proyecto ######
  ########################################
  
  tags = {
    ManagedBy = "Terraform"
    Proyect = "infra-basic-alb"
  }
}