terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "fsdemo-tfstate-rg"
    storage_account_name = "fsdemotfstate9564"
    container_name       = "tfstate"
    key                  = "lab.terraform.tfstate"
  }
}