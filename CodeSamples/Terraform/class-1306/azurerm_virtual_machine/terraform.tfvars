vms = {
  vm1 = {
    nic_name        = "frontend-vm-nic"
    location        = "centralindia"
    rg_name         = "rg-chor"
    nic_subnet_name = "frontend-subnet"
    nic_vnet_name   = "vnet-chor"
    nic_pip_name    = "pip-chor-frontend-vm"
    vm_name         = "frontend-vm"
    vm_size         = "Standard_B1s"
    admin_username  = "devopsadmin"
    admin_password  = "DevOps@123"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  vm2 = {
    nic_name        = "backend-vm-nic"
    location        = "centralindia"
    rg_name         = "rg-chor"
    nic_subnet_name = "backend-subnet"
    nic_vnet_name   = "vnet-chor"
    nic_pip_name    = "pip-chor-backend-vm"
    vm_name         = "backend-vm"
    vm_size         = "Standard_B1s"
    admin_username  = "devopsadmin"
    admin_password  = "DevOps@123"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
}
