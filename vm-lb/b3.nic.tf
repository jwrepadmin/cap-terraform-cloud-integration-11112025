resource "azurerm_network_interface" "web_nic" {
  for_each = var.vm
   name                = "${local.resource_name_prefix}-nic${each.key}"
  location            = azurerm_resource_group.rg-cap.location
  resource_group_name = azurerm_resource_group.rg-cap.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.web_subnet.id
    private_ip_address_allocation = "Dynamic"
   # public_ip_address_id = azurerm_public_ip.web_public_ip.id
  }
}