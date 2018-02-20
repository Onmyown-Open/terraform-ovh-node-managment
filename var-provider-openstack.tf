# List all variables for providerOpenStack.tf file
variable "openstack_user_name" {
  description = "Openstack User Name"
}

variable "openstack_password" {
  description = "Openstack Password"
}

variable "openstack_tenant_name" {
  description = "Openstack Tenant Name"
}

variable "openstack_auth_url" {
  description = "Openstack Auth Url"
  default     = "https://auth.cloud.ovh.net/v2.0/"
}