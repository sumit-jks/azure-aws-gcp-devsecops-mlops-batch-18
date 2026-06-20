bastions = {
  bastion1 = {
    name                = "bastion-bhakua"
    location            = "West US"
    resource_group_name = "rg-bhakua"
    # Note: In a real scenario, you'd use a data source or a remote state to get this ID
    # For now, I'll put a placeholder or assume they'll fill it in.
    # Or I can use a data block in main.tf to fetch it.
    subnet_id           = "/subscriptions/SUBSCRIPTION_ID/resourceGroups/rg-bhakua/providers/Microsoft.Network/virtualNetworks/vnet-bhakua/subnets/AzureBastionSubnet"
  }
}
