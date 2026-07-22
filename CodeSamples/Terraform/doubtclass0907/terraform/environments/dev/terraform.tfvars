rgs = {
  rg1 = {
    name     = "dev-rg"
    location = "East US"
  }
}


vnets = {
  vnet1 = {
    name                = "dev-vnet"
    location            = "East US"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "dev-rg"
  }
}
