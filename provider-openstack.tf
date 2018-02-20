# Configure the OpenStack Provider
provider "openstack" {
    user_name  = "${var.openstack_user_name}"
    password  = "${var.openstack_password}"
		tenant_name = "${var.openstack_tenant_name}"
    auth_url  = "${var.openstack_auth_url}"
}