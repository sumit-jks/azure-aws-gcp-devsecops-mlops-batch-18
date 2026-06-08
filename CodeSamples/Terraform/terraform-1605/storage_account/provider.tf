terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "apple-rg"
    storage_account_name = "stgapple1012"
    container_name       = "mango"
    key                  = "storage.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

