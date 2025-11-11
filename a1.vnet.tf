resource "azurerm_virtual_network" "vnet-cap" {
  name                = var.vnet_name
  #vnet required location and name of the resource group
  location            = azurerm_resource_group.rg-cap.location
  resource_group_name = azurerm_resource_group.rg-cap.name
  address_space       = var.vnet_address_space
 tags = local.project_tags
}
