variable "region" {
  description = "Default region for OCI resources"
  type        = string
}

variable "insatnce_availability_domain" {
  description = "Default AD for OCI resources"
  type        = string
}

variable "compartment_id" {
  description = "Default compartment for OCI resources"
  type        = string
}

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
  description = "The list of one or more IPv4 CIDR blocks for the VCN"
  type        = string
}
