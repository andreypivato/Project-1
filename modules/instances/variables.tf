variable "tfvnet_publicip_name" {
    description = "Public IP Name"
}

variable "tfvnet_nic_name" {
    type = string
    description = "Nic Name"
}

variable "tfvnet_nic_location" {
    type = string
    description = "Nic Location"
}

variable "tfvnet_nic_rg" {
    type = string
    description = "Nic Resource Group"
}

variable "tfvnet_ip_name" {
    type = string
    description = "IP Configuration Name"
}

variable "tfvnet_ip_subnet_id" {
    description = "Subnet ID"
}

variable "tfvm_name" {
    type = string
    description = "VM Name"
}

variable "tfvm_size" {
    type = string
    description = "VM Sku"
}

variable "tfvm_disk_os_name" {
    type = string
    description = "Disk OS Name"
}

variable "tfos_image_publisher" {
    type = string
    description = "Publisher Name"
}

variable "tfos_image_offer" {
    type = string
    description = "Offer OS name"
}

variable "tfos_image_sku" {
    description = "OS Image SKU"
}

variable "admin_password" {
    description = "Admin User"
}

variable "admin_username" {
    description = "Admin Password"
}