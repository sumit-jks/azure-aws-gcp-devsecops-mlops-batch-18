peerings = {
  vnet1_to_vnet2 = {
    name                         = "peering-prod-to-dev"
    resource_group_name          = "rg-dhondhu"
    virtual_network_name         = "vnet-production"
    remote_virtual_network_id    = "/subscriptions/.../virtualNetworks/vnet-development"
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}
