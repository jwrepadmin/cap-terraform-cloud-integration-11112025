variable "resource_group_name" { #varaibles name are custom defined
  description = "The name of the resource group"
  type        = string #list of string map 
  default     = "jw-rg"
}

variable "resource_group_location" {
  description = "this is the rg location"
  type = string
  default = "eastus"
}

variable "environment" {
  description = "the environment for the resources"
  type = string
  default = "dev"
}

variable "business_unit" {
  description = "business unit name"
  type = string
  default = "IT"
}