resource "azurerm_resource_group" "resource_groups" {
  for_each = var.rg_names

  name     = each.key # apple-rg, banana-rg, orange-rg
  location = each.value # eastus, westus, centralus

}
