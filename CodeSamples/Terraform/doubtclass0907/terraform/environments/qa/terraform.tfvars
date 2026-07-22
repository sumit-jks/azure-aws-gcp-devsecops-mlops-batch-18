rgs = {
  rg1 = {
    name     = "qa-rg"
    location = "East US"
  }
}


vnets = {
  vnet1 = {
    name                = "qa-vnet"
    location            = "East US"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "qa-rg"
  }
}
