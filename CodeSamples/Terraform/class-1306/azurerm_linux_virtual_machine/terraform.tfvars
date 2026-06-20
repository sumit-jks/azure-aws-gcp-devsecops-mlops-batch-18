vms = {
  vm1 = {
    name                  = "vm-bhakua-01"
    location              = "West US"
    resource_group_name   = "rg-bhakua"
    size                  = "Standard_DS1_v2"
    admin_username        = "azureuser"
    pip_name              = "pip-vm-bhakua-01"
    pip_allocation_method = "Static"
    subnet_id             = "/subscriptions/SUBSCRIPTION_ID/resourceGroups/rg-bhakua/providers/Microsoft.Network/virtualNetworks/vnet-bhakua/subnets/subnet1"
  }
}
