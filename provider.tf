#inside this file we will define the provider configuration for Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "tf-vm-wilder_group" #replace it with your storage account resource group name
    storage_account_name  = "terraformstoragewilder1" #replace it with your storage account name
    container_name        = "tfstate" #this is the name of the container
    key                   = "project-1.tfstate" #once the state file get create this will be the name of the state file
  } 
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  # resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
}
#below that define this varaibles 
variable "client_id" {
  type = string
}
 
variable "client_secret" {
  type = string
}
 
variable "subscription_id" {
  type = string
}
 
variable "tenant_id" {
  type = string
}

#

