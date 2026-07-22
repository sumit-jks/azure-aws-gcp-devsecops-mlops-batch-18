terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-micro-dev"
    storage_account_name = "netfliixstoraage"
    container_name       = "tfstate"
    key                  = "virtual_network.tfstate"
  }
}

provider "azurerm" {
  features {}
}
