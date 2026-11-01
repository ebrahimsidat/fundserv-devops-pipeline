output "resource_group_name" {
  value = azurerm_resource_group.lab.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  value = azurerm_subnet.app.id
}

output "vm_public_ip" {
  value = azurerm_public_ip.vm.ip_address
}

output "ssh_command" {
  value = "ssh -i ~/.ssh/fsdemo_rsa ${var.admin_username}@${azurerm_public_ip.vm.ip_address}"
}