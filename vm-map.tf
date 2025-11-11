variable "vm" {
  description = "the number of vm which will be created"
  type = map(string)
  default = {
    audi = "vwg",
    bentley = "vwg",
    
  }
}