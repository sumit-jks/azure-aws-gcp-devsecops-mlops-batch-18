storage_accounts = {
  sa1 = {
    name                     = "sadatastoreprod01"
    resource_group_name      = "rg-dhondhu"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "production"
    }
  }
}
