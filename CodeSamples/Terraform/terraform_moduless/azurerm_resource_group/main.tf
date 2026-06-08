resource "azurerm_resource_group" "dhondhu" {
  for_each = {
    rg-modi-ji   = "centralindia" 
    rg-meloni-ji = "italynorth"
  }
  name     = each.key # rg-meloni-ji
  location = each.value # "italynorth"
}
