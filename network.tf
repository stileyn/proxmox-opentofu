resource "proxmox_virtual_environment_network_linux_bridge" "vmbr10" {

  node_name = "pve"
  name      = "vmbr10"

  comment = "internal network"

}