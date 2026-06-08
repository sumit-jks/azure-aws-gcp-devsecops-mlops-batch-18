variable "list_of_rgs" {}

resource "azurerm_resource_group" "rg" {
  for_each = toset(var.list_of_rgs)
  name     = each.key
  location = "westus"
}


