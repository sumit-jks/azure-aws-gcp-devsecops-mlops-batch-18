rgs = {
  rg1 = {
    name     = "prod-rg"
    location = "East US"
  }
}


vnets = {
  vnet1 = {
    name                = "prod-vnet"
    location            = "East US"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "prod-rg"
  }
}
