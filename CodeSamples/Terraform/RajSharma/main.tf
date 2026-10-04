variable "resource_groups" {}

resource "azurerm_resource_group" "rgs" {
  for_each = toset(var.resource_groups)
  name     = each.value
  location = "Canada Central"
}
