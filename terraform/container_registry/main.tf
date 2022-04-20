resource "random_name" "server" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    rg_name = "${var.rg_name}"
  }

  byte_length = 16
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = "eastus"
}

resource "azurerm_container_registry" "acr" {
  name                = "terraformcrt01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = true

  tags = {
    env  = "prod"
    name = "terraform-cr"
  }

}
