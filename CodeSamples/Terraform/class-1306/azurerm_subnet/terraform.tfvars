subnets = {
  subnet1 = {
    name                 = "subnet1"
    resource_group_name  = "rg-bhakua"
    virtual_network_name = "vnet-bhakua"
    address_prefixes     = ["10.0.1.0/24"]
  }
  bastion_subnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-bhakua"
    virtual_network_name = "vnet-bhakua"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
