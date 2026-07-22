variable "vnets" {}
variable "rgs" {}
module "resource_group" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.rgs
}

module "virtual_network" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_virtual_network"
  virtual_networks = var.vnets
}
