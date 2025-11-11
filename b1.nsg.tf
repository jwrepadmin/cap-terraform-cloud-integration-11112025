resource "azurerm_network_security_group" "web_nsg" {
  name                = "${local.resource_name_prefix}-nsg"
  location            = azurerm_resource_group.rg-cap.location
  resource_group_name = azurerm_resource_group.rg-cap.name

    tags = local.project_tags
}
#once we create the nsg it need to attache with whom subnet
resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}
#we need to add multiple ports in nsg 80 22 443
locals {
  web_nsg_rule = { #named
    "110" : "22", #expression we are defini using pirority and port
    "120" : "80",
    "130" : "443"
  }
}
resource "azurerm_network_security_rule" "web_nsg_rule" {
    for_each = local.web_nsg_rule
  name                        = "Rule_port_${each.value}" #22
  priority                    = each.key #110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value #22
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-cap.name
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

