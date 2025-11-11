/*resource "azurerm_public_ip" "web_public_ip" {
  name                = "${local.resource_name_prefix}-public-ip"
  location            = azurerm_resource_group.rg-cap.location
  resource_group_name = azurerm_resource_group.rg-cap.name
  allocation_method   = "Static"
sku = "Standard" #basic #premium
  tags = local.project_tags
}*/