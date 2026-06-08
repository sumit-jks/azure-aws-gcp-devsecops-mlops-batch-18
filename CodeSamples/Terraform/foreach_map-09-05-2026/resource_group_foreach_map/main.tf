resource "azurerm_resource_group" "rg" {
  for_each = {
    "rg-adam"  = "westus"
    "rg-ale"   = "eastus"
    "rg-tinku" = "centralindia"
  }
  name     = each.key
  location = each.value
}