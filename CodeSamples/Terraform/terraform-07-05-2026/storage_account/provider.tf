terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-prod-centralindia"
    storage_account_name = "sttfstatecix01"
    container_name       = "tfstate"
    key                  = "storage.tfstate"
  }
}

provider "azurerm" {
  features {}
}
