// This module provides functional of firewall and routing.

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.61.1"
    }
  }
}

resource "proxmox_virtual_environment_vm" "gw" {
  name      = "gw2"
  description = "Managed by Terraform"
  tags        = ["terraform", "ubuntu", "gateway"]

  node_name = "proxmox"

  stop_on_destroy = true

  initialization {
    datastore_id = "vm"
    ip_config {
      ipv4 {
        address = "5.43.226.178/24"
        gateway = "5.43.226.1"
      }
    }

    ip_config {
      ipv4 {
        address = "172.16.100.1/24"
        gateway = "172.16.100.1"
      }
    }
    user_account {
      keys     = [trimspace(var.virtual_environment_ssh_public_keys)]
      username = "ubuntu"
    }
  }

  cpu {
    cores = 1
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "vm"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface    = "scsi0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  network_device {
    bridge = "vmbr0"
  }
  network_device {
    bridge = "vmbr10"
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "proxmox"

  url = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}
