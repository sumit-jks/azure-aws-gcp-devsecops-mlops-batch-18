terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.66.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "mh_aurangabad" {
  name     = "madamo_ki_madam_sabse_badi_madam_apeksha_mam"
  location = "West Europe"
}

resource "azurerm_resource_group" "nora-delhi" {
  name     = "rg-nora-delhi"
  location = "West Europe"
}

resource "azurerm_resource_group" "katrina-kolkata" {
  name     = "rg-katrina-kolkata"
  location = "Central India"
}