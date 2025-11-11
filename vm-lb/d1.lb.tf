#to create the lb we will first create an public ip 
resource "azurerm_public_ip" "lb_public_ip" {
  name                = "${local.resource_name_prefix}-lbpublic-ip"
  location            = azurerm_resource_group.rg-cap.location
  resource_group_name = azurerm_resource_group.rg-cap.name
  allocation_method   = "Static"
sku = "Standard" #basic #premium
  tags = local.project_tags
}
#we need to create the lb and attach the public ip 
resource "azurerm_lb" "web_lb" {
   name                = "${local.resource_name_prefix}-lbpublic-ip"
  location            = azurerm_resource_group.rg-cap.location
  resource_group_name = azurerm_resource_group.rg-cap.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}
#we need to create the backend pool to attach our vm nic 
resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name            = "BackEndAddressPool"
}

#lets create teh health probe
resource "azurerm_lb_probe" "lb_health_probe" {
  loadbalancer_id = azurerm_lb.web_lb.id #it need to attach with lb
  name            = "HTTPHealthProbe"
  protocol        = "Tcp"
  port            = 80
 # request_path    = "/" #if your application is running on a different path you can change it
  interval_in_seconds = 30
  number_of_probes    = 2 #two times it is going to ping if it is not getting response it will mark as unhealthy
}

#we need to creat the lb rule to direct the traffic from frontend to backend pool
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id            = azurerm_lb.web_lb.id
  name                       = "HTTPRule"
  protocol                   = "Tcp"
  frontend_port              = 80 #this is the load balancer port
  backend_port               = 80 #this is the vm port where our application is running
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  backend_address_pool_ids    = [azurerm_lb_backend_address_pool.lb_backend_pool.id]
  probe_id                   = azurerm_lb_probe.lb_health_probe.id
  
}
#finally we need to attach the nic card with your backend pool
resource "azurerm_network_interface_backend_address_pool_association" "nic_lb_association" {
  for_each = var.vm
  network_interface_id       = azurerm_network_interface.web_nic[each.key].id
  ip_configuration_name      = azurerm_network_interface.web_nic[each.key].ip_configuration[0].name
  backend_address_pool_id    = azurerm_lb_backend_address_pool.lb_backend_pool.id
}