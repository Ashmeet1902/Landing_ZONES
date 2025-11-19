terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  // backend "azurerm" {
  //   resource_group_name  = "BackendResourceGroup"
  //   storage_account_name = "backendstorageacc15078"
  //   container_name       = "backendcontainer"
  //   key                  = "terraform.tfstate"
  // }
  required_version = ">= 1.2.0"
}
provider "azurerm" {
  features {}
  subscription_id = "4ee6e3a8-6630-4246-a7f9-85b60de68cf8"
}