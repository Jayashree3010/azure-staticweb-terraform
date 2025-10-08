terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-staticweb"
  location = "East US"
}

resource "azurerm_static_site" "static" {
  name                = "my-static-web-${random_integer.rand.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_tier            = "Free"
  sku_size            = "Free"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}
