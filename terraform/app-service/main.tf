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

