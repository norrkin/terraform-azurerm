terraform {
  required_providers {
    azurerm = {
      version = "=2.70.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate97921246"
    container_name       = "tfstate"
    key                  = "terraform-azurerm-backend.tfstate"
  }
}