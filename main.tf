resource "azurerm_resource_group" "terraform-azurerm-backend" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = local.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "terraform-azurerm-backend-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  tags = local.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "terraform-azurerm-backend-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.8.0/24"]

}