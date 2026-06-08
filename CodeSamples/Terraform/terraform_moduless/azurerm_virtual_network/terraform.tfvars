virtual_networks = {
  vnet1 = {
    name                = "example-network"
    location            = "eastus"
    resource_group_name = "example-resource-group"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "example-network-2"
    location            = "eastus"
    resource_group_name = "example-resource-group"
    address_space       = ["10.1.0.0/16"]
  }

}
