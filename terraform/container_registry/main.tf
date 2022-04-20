resource "azurerm_resource_group" "rg" {
  name     = "terraform-rg-t01"
  location = "eastus"
}

resource "azurerm_container_registry" "acr" {
  name                = "terraformcr-t01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = true

  tags = {
    env  = "prod"
    name = "terraform-cr"
  }

}
