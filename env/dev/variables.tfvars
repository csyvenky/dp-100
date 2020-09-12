#
# Resource Group
#
rg_name     = "dp-100-dev"
rg_location = "canadacentral"

#
# Storage Account for Machine Learning Workspace
#
sa_name                     = "dp100sadev"
sa_account_tier             = "Standard"
sa_account_replication_type = "LRS"
sa_account_kind             = "StorageV2"
sa_is_hns_enabled           = "false"

#
# Key Vault for Machine Learning Workspace
#
kv_name = "dp-100-kv-dev"
# secrets.tfvars for FW IPs

#
# Machine Learning Workspace
#
app_insights_name  = "dp-100-ai-dev"
mlws_name          = "mlws-dev"
mlws_sku           = "Basic"
mlws_description   = "This is the Development version of the Azure ML Workspace."
mlws_friendly_name = "My Dev ML Workspace"