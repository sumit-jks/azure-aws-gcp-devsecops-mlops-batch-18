storage_accounts = {
  sa1 = {
    name                     = "tinkustg"
    location                 = "eastus"
    resource_group_name      = "apple-rg"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  sa2 = {
    name                     = "pinkustg"
    location                 = "westus"
    resource_group_name      = "banana-rg"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}
