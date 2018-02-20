resource "ovh_publiccloud_private_network" "internal_network" {
	project_id = "${var.project_id}"
	name       = "${var.internal_network_name}"
	regions    = ["${var.region}"]
}

resource "ovh_publiccloud_private_network_subnet" "internal_network_subnet" {
	project_id = "${var.project_id}"
	network_id = "${ovh_publiccloud_private_network.internal_network.id}"
	region     = "${var.region}"
	start      = "192.168.168.100"
	end        = "192.168.168.200"
	network    = "192.168.168.0/24"
	dhcp       = true
	no_gateway = false
}

resource "openstack_compute_instance_v2" "private" {
	count = "${var.nb_private_instance}"
	name = "private-instance-${count.index}"
	region = "${var.region}"
	flavor_name = "${var.flavor_name}"
	image_name = "${var.image_name}"
	key_pair = "${var.private_key_name}"
	security_groups = ["${var.security_groups}"]
	network {
    name = "${var.internal_network_name}"
    access_network = true
  }
	depends_on = ["ovh_publiccloud_private_network_subnet.internal_network_subnet"]
}

resource "openstack_compute_instance_v2" "hybrid" {
	count = "${var.nb_hybrid_instance}"
	name = "hybrid-instance-${count.index}"
	region = "${var.region}"
	flavor_name = "${var.flavor_name}"
	image_name = "${var.image_name}"
	key_pair = "${var.private_key_name}"
	security_groups = ["${var.security_groups}"]
	network {
    name = "${var.internal_network_name}"
    access_network = true
  }
	network {
    name = "Ext-Net"
    access_network = true
  }
	depends_on = ["ovh_publiccloud_private_network_subnet.internal_network_subnet"]
}

resource "openstack_compute_instance_v2" "public" {
	count = "${var.nb_public_instance}"
	name = "public-instance-${count.index}"
	region = "${var.region}"
	flavor_name = "${var.flavor_name}"
	image_name = "${var.image_name}"
	key_pair = "${var.private_key_name}"
	security_groups = ["${var.security_groups}"]
	network {
    name = "Ext-Net"
    access_network = true
  }
}