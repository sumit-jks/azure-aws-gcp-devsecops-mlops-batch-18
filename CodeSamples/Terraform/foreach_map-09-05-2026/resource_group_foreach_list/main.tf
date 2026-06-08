resource "azurerm_resource_group" "rg" {
  for_each = toset(["rg-lipistic", "rg-maskara", "rg-bindi", "rg-shampoo"])
  name     = each.value
  location = "West Europe"
}
