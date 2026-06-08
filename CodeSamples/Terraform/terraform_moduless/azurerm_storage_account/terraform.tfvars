storage_accounts = {
  sa1 = {
    name                     = "meloniji_storage"
    resource_group_name      = "rg-meloni-ji"
    rg_location              = "italynorth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  sa2 = {
    name                     = "modiji_storage"
    resource_group_name      = "rg-modi-ji"
    rg_location              = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  sa3 = {
    name                     = "rahulji_storage"
    resource_group_name      = "rg-modi-ji"
    rg_location              = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}
