resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_id
  cidr_blocks    = var.vcn_cidr
}

resource "oci_core_subnet" "subnet" {
  cidr_block     = var.subnet_cidr
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
}
