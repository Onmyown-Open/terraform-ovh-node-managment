# List all variables for main.tf file
variable "project_id" {
	description = "OVH Project ID"
}

variable "internal_network_name" {
	description = "Internal Network name"
  default     = "Int-Net"
}

variable "nb_private_instance" {
	description = "Number of private instance"
  default     = "1"
}

variable "nb_hybrid_instance" {
	description = "Number of private instance"
  default     = "1"
}

variable "nb_public_instance" {
	description = "Number of public instance"
  default     = "1"
}

variable "region" {
	description = "Region where to create instance"
  default     = "SBG1"
}

variable "flavor_name" {
	description = "Type of server"
  default     = "vps-ssd-1"
}

variable "image_name" {
	description = "Image name"
  default     = "CoreOS Stable"
}

variable "private_key_name" {
  description = "Private key name"
}

variable "security_groups" {
  description = "Security Group"
  default     = "default"
}