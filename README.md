# Node creation using OVH and Terraform

The aim of this repo is to provide a simple way to create compute nodes using OVH and Terraform.
Here is a breakdown of what contains the various files:
- main.tf: describe the networking and compute settings
- var.tf: variables used in the main.tf file
- provider-openstack.tf: describe the OpenStack connection
- var-provider-openstack.tf: variables used in the provider-openstack.tf
- provider-ovh.tf: describe the OVH connection
- var-provider-ovh.tf: variables used in the provider-ovh.tf

## How to use this repos?
Clone the repos
```
git clone git@gitlab.com:onmyown-open-source/terraform-ovh-node-managment.git
cd terraform-ovh-node-managment
```
Initalise Terraform
```
terraform init
```
Apply the Terraform configuration
```
terraform apply
```
Destroy the infrastructure previously created
```
terraform destroy
```
