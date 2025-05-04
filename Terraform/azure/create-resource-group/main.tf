terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg1"
    storage_account_name = "tfbackend20250504"
    container_name       = "tfstatestorage"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "terraform-rg" {
  name     = "tf-rg2"
  location = "East US"
}

resource "azurerm_virtual_network" "tf_vn" {
  name                = "tf_virtual_network3"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terraform-rg.location
  resource_group_name = azurerm_resource_group.terraform-rg.name
}
