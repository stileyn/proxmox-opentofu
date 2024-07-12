resource "proxmox_virtual_environment_network_linux_bridge" "vmbr10" {

  node_name = "proxmox"
  name      = "vmbr10"

  comment = "internal network"

}