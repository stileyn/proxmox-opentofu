data "local_file" "ssh_public_key" {
  filename = "./id_rsa.pub"
}

module "gw" {
  source = "./modules/gw"
  virtual_environment_ssh_public_keys = data.local_file.ssh_public_key.content
}