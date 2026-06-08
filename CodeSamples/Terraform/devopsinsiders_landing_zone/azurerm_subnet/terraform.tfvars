snets = {
  snet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "dhondhu-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "rondu-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}
