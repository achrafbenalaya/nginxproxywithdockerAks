variable "cluster_name" {
  description = "The name for the AKS cluster"
  default     = "achrafdoingaks"
}
variable "env_name" {
  description = "The environment for the AKS cluster"
  default     = "dev"
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_location" {
  default     = "northeurope"
  description = "Location of the resource group."
}

# Refer to https://azure.microsoft.com/pricing/details/monitor/ for Log Analytics pricing
variable "log_analytics_workspace_sku" {
  default = "PerGB2018"
}

variable "log_analytics_workspace_name" {
  default = "testLogAnalyticsWorkspaceachraf"
}

# Refer to https://azure.microsoft.com/global-infrastructure/services/?products=monitor for available Log Analytics regions.
variable "log_analytics_workspace_location" {
  default = "northeurope"
}
variable "dns_prefix" {
  default = "hostnametest"
}

variable "agent_count" {
  default = 1
}