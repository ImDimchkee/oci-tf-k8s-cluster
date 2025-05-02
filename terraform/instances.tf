resource "oci_core_instance" "instance-1" {
  availability_domain = var.availability_domain
  compartment_id = var.compartment_id
  shape = var.insatnce_shape

  create_vnic_details {
    subnet_id = oci_core_subnet.subnet.id
  }
}
