terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.2.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-devopsinsiders"
    storage_account_name = "ditfstore"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
}
