variable "vm_instance_size" {
  description = "map of the instance size with different environment"
  type = map(string)
  default = {
    "testing" = "Standard_B1s", #1 core processor 1.75 gb ram
    "development" = "Standard_F2", #2 core processor 4 gb ram
    "production" = "Standard_D2s_v3"#2 core processor 8 gb ram    
  }
}