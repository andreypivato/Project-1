terraform {
    required_version = ">= 0.15"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "tfnsg" {
    name                = var.nsg_name
    location            = var.nsg_location
    resource_group_name = var.nsg_rg

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}