Hello,

This script was created to help launch a basic Linux Instance in Azure.

This script also create a VNET, Subnet, Virtual Machine with Linux Ubuntu and NSG with port 22 allowed.

Before run the script, need add you Subscription ID in the file:
terraform.tfvars - Line 2 - xsubscription variable

Change all the required requisites in the file terraform.tfvars.
You can choose: OS, VNet and Subnet Scope, Location

To Admin and Admin password, please edit the file:
modules/instances/secret.auto.tfvars
admin_username and admin_password.

After all required changes, you can plan folowing this command:
terraform plan -var-file .\modules\instances\secret.auto.tfvars

Apply:
terraform apply -var-file .\modules\instances\secret.auto.tfvars

Destory:
terraform destroy -var-file .\modules\instances\secret.auto.tfvars

Any doubts, please contact me by andreypivato@gmail.com

Thank you
