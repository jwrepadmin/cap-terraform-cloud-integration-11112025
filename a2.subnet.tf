#
resource "azurerm_subnet" "web_subnet" {
  name                 = var.web_subnet_name
  resource_group_name  = azurerm_resource_group.rg-cap.name 
  virtual_network_name = azurerm_virtual_network.vnet-cap.name
  address_prefixes     = var.web_subnet_address_spaces
}