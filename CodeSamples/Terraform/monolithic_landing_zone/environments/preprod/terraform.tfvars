rgs = {
  rg1 = {
    name     = "rg-chor"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-chor"
    location            = "centralindia"
    resource_group_name = "rg-chor"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  snet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-chor"
    virtual_network_name = "vnet-chor"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-chor"
    virtual_network_name = "vnet-chor"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

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
