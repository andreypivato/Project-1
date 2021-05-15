#Global
xsubscription = "<Your Subscription ID>"
xresource_group_name = "TFResourceGroup"
xlocation = "eastus2"

#Virtual Network
xvnet_name = "TFVnet"
xvnet_scope = ["10.10.0.0/16"]
xvnet_subnet_name = "TFSubnet01"
xvnet_scope_subnet = ["10.10.1.0/24"]
xnsg_name = "TFNsg"

#Virtual Machine
xtfvnet_publicip_name = "TFPIP"
xtfvnet_nic_name = "TFNic01"
xtfvnet_ip_name = "TFNicConfig"
xtfvm_name = "TFUbuntuServer"
xtfvm_size = "Standard_DS1_v2"
xtfvm_disk_os_name = "TFOSDisk"
xtfos_image_publisher = "Canonical"
xtfos_image_offer = "UbuntuServer"
xtfos_image_sku = "18.04-LTS"
