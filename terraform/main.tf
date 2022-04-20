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
  client_secret              = "488njuWukZ5s.jhd2yTY7Q_.fA5Vj9CZeW"
  tenant_id                  = "36171de4-ea6e-4713-a3c6-163fdbc11f9a"
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform-rg"
  location = "eastus"
}

resource "azurerm_container_registry" "acr" {
  name                = "terraformcr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = true

  tags = {
    env  = "prod"
    name = "terraform-cr"
  }

}

resource "azurerm_service_plan" "sp" {
  name                = "terraformsp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "eastus"
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "lwa" {
  name                = "terraformappservicenttLabdeploy"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.sp.id

  site_config {
    always_on             = true
    managed_pipeline_mode = "Integrated"

    application_stack {
      docker_image     = "nttlabcr.azurecr.io/react/nextjs"
      docker_image_tag = "0a971ea261f94c56b4d30831d58776ae685905a2"
    }
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_PASSWORD" : "${azurerm_container_registry.acr.admin_password}",
    "DOCKER_REGISTRY_SERVER_URL" : "${azurerm_container_registry.acr.login_server}",
    "DOCKER_REGISTRY_SERVER_USERNAME" : "${azurerm_container_registry.acr.admin_username}",
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" : "false",
    "WEBSITE_PORT" : "3000"
  }

}

resource "azurerm_linux_web_app_slot" "slwa" {
  name                = "qa"
  app_service_id = azurerm_linux_web_app.lwa.id

  site_config {
    managed_pipeline_mode    = "Integrated"
    always_on = true

     application_stack {
      docker_image     = "nttlabcr.azurecr.io/react/nextjs"
      docker_image_tag = "0a971ea261f94c56b4d30831d58776ae685905a2"
    }

  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_PASSWORD" : "${azurerm_container_registry.acr.admin_password}",
    "DOCKER_REGISTRY_SERVER_URL" : "${azurerm_container_registry.acr.login_server}",
    "DOCKER_REGISTRY_SERVER_USERNAME" : "${azurerm_container_registry.acr.admin_username}",
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" : "false",
    "WEBSITE_PORT" : "3000"
  }
}

