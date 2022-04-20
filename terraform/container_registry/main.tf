resource "azurerm_resource_group" "rg" {
  name     = "terraform-rg-t05"
  location = "eastus"
}

resource "azurerm_container_registry" "acr" {
  name                = "terraformcrt05"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = true

#   tags = {
#     env  = "prod"
#     name = "terraform-crt03"
#   }

}