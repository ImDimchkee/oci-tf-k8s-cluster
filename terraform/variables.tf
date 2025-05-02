
# # OCI - General

variable "region" {
  description = "Default region for OCI resources"
  type        = string
}

variable "availability_domain" {
  description = "Default AD for OCI resources"
  type        = string
}

variable "compartment_id" {
  description = "Default compartment for OCI resources"
  type        = string
}

variable "tenancy_ocid" {
  description = "OCID of the tenancy"
  type = string
}

variable "user_ocid" {
  description = "OCID of the user calling the API"
  type = string
}

variable "private_key_path" {
  description = "The path (including filename) of the private key stored on the computer"
  type = string
}

variable "fingerprint" {
  description = "Fingerprint for the key pair being used"
  type = string
}

# # Compute

variable "insatnce_shape" {
  description = "Default shape for instance resources"
  type        = string
}

# # VCN

variable "vcn_cidr" {
  description = "The list of one or more IPv4 CIDR blocks for the VCN"
  type        = list(string)
}

variable "subnet_cidr" {
  description = "The list of one or more IPv4 CIDR blocks for the subnet"
  type        = string
}

variable "vcn_gateway_enabled" {
  description = "Enable or disable VCN gateway to Internet"
  type        = bool
}

# # LB

variable "lb_displayname" {
  description = "Display name for Loadbalancer"
  type        = string
}

variable "lb_shape" {
  description = "Shape config for Loadbalancer"
  type        = string
  default     = "10Mbps"
}
