terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_storage_account" "storage" {
  name                     = "tfpractice2026storage"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}
resource "azurerm_resource_group" "multiple" {
  for_each = toset(var.resource_groups)

  name     = each.value
  location = "Central India"
}
# Git branch practice