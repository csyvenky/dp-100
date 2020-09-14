terraform {
  required_version = ">= 0.13.2"
}

#
# Terraform providers for 
# - Azure Resource Manager
#
provider "azurerm" {
  version = "~> 2.27"
  features {}
  subscription_id = var.subscription_id
}

#
# Lookup current client context
#
data "azurerm_client_config" "current" {}

#
# Resource Group and Azure Region
#
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

#
# Application Insights for Machine Learning Workspace
#
resource "azurerm_application_insights" "app_insights" {
  name                = var.app_insights_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  application_type    = "web"
}

#
# Storage Account for Machine Learning Workspace
#
resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.sa_account_tier
  account_replication_type = var.sa_account_replication_type
  account_kind             = var.sa_account_kind
  is_hns_enabled           = var.sa_is_hns_enabled
}

#
# Key Vault for Machine Learning Workspace
#
resource "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled = true

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
      "set",
      "list",
      "delete"
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules       = var.kv_ip_fw
  }
}

#
# Azure Container Registry for Machine Learning Workspace
#
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}

#
# Machine Learning Workspace
#
resource "azurerm_machine_learning_workspace" "mlws" {
  name                    = var.mlws_name
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  application_insights_id = azurerm_application_insights.app_insights.id
  key_vault_id            = azurerm_key_vault.kv.id
  storage_account_id      = azurerm_storage_account.sa.id
  container_registry_id   = azurerm_container_registry.acr.id
  sku_name                = var.mlws_sku
  description             = var.mlws_description
  friendly_name           = var.mlws_friendly_name

  identity {
    type = "SystemAssigned"
  }
}