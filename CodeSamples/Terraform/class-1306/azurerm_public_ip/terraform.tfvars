public_ips = {
  pip1 = {
    public_ip_name      = "pip-chor-frontend-vm"
    resource_group_name = "rg-chor"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip2 = {
    public_ip_name      = "pip-chor-backend-vm"
    resource_group_name = "rg-chor"
    location            = "centralindia"
    allocation_method   = "Static"
  }  
}
