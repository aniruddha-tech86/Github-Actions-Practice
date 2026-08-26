terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-practice"
    storage_account_name = "tfpractice2026storage"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}