
#
# Subscription Details 
#
variable "subscription_id" {}

#
# Resource Group Details
#
variable "rg_name" {}
variable "rg_location" {}

#
# Storage Account for Machine Learning Workspace
#
variable "sa_name" {}
variable "sa_account_tier" {}
variable "sa_account_replication_type" {}
variable "sa_account_kind" {}
variable "sa_is_hns_enabled" {}

#
# Key Vault for Machine Learning Workspace
#
variable "kv_name" {}
variable "kv_ip_fw" {}

#
# Machine Learning Workspace
#
variable "app_insights_name" {}
variable "mlws_name" {}
variable "mlws_sku" {}
variable "mlws_description" {}
variable "mlws_friendly_name" {}