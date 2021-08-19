resource "azurerm_resource_group" "terraform-azurerm-backend" {
  name     = var.resource_group_name
  location = var.location

  tags = local.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "terraform-azurerm-backend-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terraform-azurerm-backend.location
  resource_group_name = azurerm_resource_group.terraform-azurerm-backend.name

  tags = local.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "terraform-azurerm-backend-subnet"
  resource_group_name  = azurerm_resource_group.terraform-azurerm-backend.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.8.0/24"]
}

resource "azurerm_network_security_group" "security_group" {
  name                = "security_group"
  location            = azurerm_resource_group.terraform-azurerm-backend.location
  resource_group_name = azurerm_resource_group.terraform-azurerm-backend.name

  security_rule {
    name                       = "test123"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = merge(
    module.backend_label.tags,
    {
      additional_tag = "Production"
    },
  )
}