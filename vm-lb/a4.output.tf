output "resource_group_name" {
  description = "Name of the resource group"
  value = azurerm_resource_group.rg-cap.name
}

output "resource_group_location" {
  description = "Name of the resource group location"
  value = azurerm_resource_group.rg-cap.location
}

output "virtual_network_name" {
  description = "Name of the virtual network"
  value = azurerm_virtual_network.vnet-cap.name
}
output "nsg_name" {
  description = "this is the name of the nsg"
  value = azurerm_network_security_group.web_nsg.name
}

/*output "vm_publicip" {
  description = "this is the vm public ip"
  value = azurerm_public_ip.web_public_ip.ip_address
}*/
output "lb_public_ip" {
  description = "public ip of the load balancer "
  value = azurerm_public_ip.lb_public_ip.ip_address
}

output "private_ip_of_vm" {
  description = "private ip address of the vm"
  value = values(azurerm_network_interface.web_nic)[*].private_ip_address
}

output "vm_name" {
  description = "nameofthevm"
  value = values(azurerm_linux_virtual_machine.web_vm)[*].name
}