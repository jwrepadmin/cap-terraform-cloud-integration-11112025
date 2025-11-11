variable "vnet_name" {
    description = "The name of the virtual network"
    type        = string
    default     = "cap-network"
  
}
variable "vnet_address_space" {
  description = "the address space that is used by virtual network"
  type = list(string)
  default = [ "10.0.0.0/16" ] #this is also called as array
}

variable "web_subnet_name" {
  description = "this is the websubnet"
  type = string 
  default = "web_subnet"
}

variable "web_subnet_address_spaces" {
  type = list(string)
  default = ["10.0.1.0/24"]
}