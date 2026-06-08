vnets = {
  vnet1 = {
    name                = "dhondhu-vnet"
    location            = "eastus"
    resource_group_name = "rg-dhondhu"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "rondu-vnet"
    location            = "westus"
    resource_group_name = "rg-rondu"
    address_space       = ["10.124.0.0/16"]
  }
}
