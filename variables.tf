variable "virtual_environment_endpoint" {
  type        = string
  description = "The endpoint for the Proxmox Virtual Environment API (example: https://host:port)"
  default = "https://5.43.226.106:8006"
}

variable "virtual_environment_token" {
  type        = string
  description = "The token for the Proxmox Virtual Environment API"
  default = "terraform@pam!terraform=3f16074d-305f-47a0-8dc9-c7ca42195467"
}

