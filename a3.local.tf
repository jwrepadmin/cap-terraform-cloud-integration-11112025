locals {
  owner = var.business_unit #it
  environment = var.environment #dev
  resource_name_prefix = "${var.environment}-${var.business_unit}"
  #dev-it
  project_tags = { #it is kkind of name 
    Owner       = local.owner #it
    Environment = local.environment #dev
    projectx = "cap-manifest"
  }
}