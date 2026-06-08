bastions = {
  bastion1 = {
    name                 = "bastion-production"
    location             = "eastus"
    resource_group_name  = "rg-dhondhu"
    subnet_id            = "/subscriptions/.../subnets/AzureBastionSubnet"
    public_ip_address_id = "/subscriptions/.../publicIPAddresses/pip-bastion"
  }
}
