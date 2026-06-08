resource "azurerm_storage_account" "storage" {
  name                     = "sto123453"
  resource_group_name      = "rg-devopsinsiders"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
