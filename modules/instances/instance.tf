terraform {
    required_version = ">= 0.15"
}

# Create public IP
resource "azurerm_public_ip" "tfpublicip" {
  name                = var.tfvnet_publicip_name
  location            = var.tfvnet_nic_location
  resource_group_name = var.tfvnet_nic_rg
  allocation_method   = "Static"
}

# Create network interface
resource "azurerm_network_interface" "tfnic" {
    name                      = var.tfvnet_nic_name
    location                  = var.tfvnet_nic_location
    resource_group_name       = var.tfvnet_nic_rg

    ip_configuration {
        name                          = var.tfvnet_ip_name
        subnet_id                     = var.tfvnet_ip_subnet_id
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = azurerm_public_ip.tfpublicip.id
    }
}

# Create a Linux virtual machine
resource "azurerm_virtual_machine" "tfvm" {
    name                  = var.tfvm_name
    location              = var.tfvnet_nic_location
    resource_group_name   = var.tfvnet_nic_rg
    network_interface_ids = [azurerm_network_interface.tfnic.id]
    vm_size               = var.tfvm_size

    storage_os_disk {
        name              = var.tfvm_disk_os_name
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = var.tfos_image_publisher
        offer     = var.tfos_image_offer
        sku       = var.tfos_image_sku
        version   = "latest"
    }

    os_profile {
        computer_name  = var.tfvm_name
        admin_username = var.admin_username
        admin_password = var.admin_password
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }
}

data "azurerm_public_ip" "ip" {
    name                = azurerm_public_ip.tfpublicip.name
    resource_group_name = var.tfvnet_nic_location
    depends_on          = [azurerm_virtual_machine.tfvm]
}