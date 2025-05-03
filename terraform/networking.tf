resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_id
  cidr_blocks    = var.vcn_cidr
}

resource "oci_core_internet_gateway" "gateway" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_route_table" "rt-default" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id

  route_rules {
    network_entity_id = oci_core_internet_gateway.gateway.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }

}

resource "oci_core_subnet" "subnet" {
  display_name        = "k8s-network"
  cidr_block          = var.subnet_cidr
  compartment_id      = var.compartment_id
  vcn_id              = oci_core_vcn.vcn.id
  route_table_id      = oci_core_route_table.rt-default.id
  availability_domain = var.availability_domain
}

# Security Group that contains fw rules
resource "oci_core_network_security_group" "default_sg" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
}

resource "oci_core_network_security_group_security_rule" "allow_ssh" {
  network_security_group_id = oci_core_network_security_group.default_sg.id

  direction = "INGRESS"
  source    = var.ip_map.home_ip
  protocol  = "6" # TCP

  description = "value"
  tcp_options {
    destination_port_range {
      max = 22
      min = 22
    }
  }

}

# resource "oci_load_balancer" "loadbalancer" {
#   compartment_id = var.compartment_id
#   display_name   = var.lb_displayname
#   shape          = var.lb_shape
#   subnet_ids     = [oci_core_subnet.subnet.id]

#   is_private = false

# }
