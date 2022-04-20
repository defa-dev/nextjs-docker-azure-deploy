terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
#   subscription_id            = var.gcc_subscription_id
#   client_id                  = var.gcc_client_id
#   client_secret              = var.gcc_client_secret
#   tenant_id                  = var.gcc_tenant_id
#   enviroment                 = var.enviroment
#   skip_provider_registration = true
}
