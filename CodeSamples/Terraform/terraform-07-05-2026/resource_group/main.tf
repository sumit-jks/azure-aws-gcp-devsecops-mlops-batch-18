# ForEach + List Way
variable "rg_names" {}

resource "azurerm_resource_group" "foreach_list" {
  for_each = toset(var.rg_names)
  name     = each.value
  location = "westeurope"
}
