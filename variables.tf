variable "subscription_id" {
  description = "Azure subscription to deploy into"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "canadacentral"
}

variable "prefix" {
  description = "Short name used at the start of every resource name"
  type        = string
  default     = "fsdemo"
}

variable "my_ip" {
  description = "Your home public IP, allowed to SSH in (CIDR format, e.g. 1.2.3.4/32)"
  type        = string
}


variable "vm_size" {
  description = "VM size (free-tier eligible)"
  type        = string
  default     = "Standard_B2pts_v2"
}

variable "admin_username" {
  description = "Linux admin user"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "~/.ssh/fsdemo_rsa.pub"
}