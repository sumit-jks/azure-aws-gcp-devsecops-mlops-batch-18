subnets = {
  snet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "vnet-dhondhu"
    address_prefixes     = ["10.143.1.0/24"]
  }
  snet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "vnet-dhondhu"
    address_prefixes     = ["10.143.2.0/24"]
  }
}
