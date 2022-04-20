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
  subscription_id            = "67394ca2-b0c3-402d-a1e5-0b954420c5fc"
  client_id                  = "e7296596-3910-494f-b928-58a71c4d0c8e"
  client_secret              = "67394ca2-b0c3-402d-a1e5-0b954420c5fc"
  tenant_id                  = "36171de4-ea6e-4713-a3c6-163fdbc11f9a"
  skip_provider_registration = true
}
