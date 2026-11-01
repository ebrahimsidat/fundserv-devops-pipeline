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