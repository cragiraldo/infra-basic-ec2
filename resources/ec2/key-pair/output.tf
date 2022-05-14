output "keypair" {
    description = "The name of the SSH keypair"
    value = module.key_pair.key_pair_key_name
}