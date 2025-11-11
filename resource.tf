resource "azurerm_resource_group" "rg-cap" { #rg-cap is the refrence lable
  name     = "${local.resource_name_prefix}-${var.resource_group_name}" #dev-it-gopal-rg
  location = var.resource_group_location
  tags = local.project_tags
}

