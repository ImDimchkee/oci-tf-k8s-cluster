# Security Group that contains fw rules
resource "oci_core_network_security_group" "default_sg" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
}

# Whitelist home IP for SSH access
resource "oci_core_network_security_group_security_rule" "ssh" {
  network_security_group_id = oci_core_network_security_group.default_sg.id
  description               = "Open port 22 for SSH access"
  direction                 = "INGRESS"
  source                    = var.ip_map.home_ip
  protocol                  = "6" # TCP
  tcp_options {
    destination_port_range {
      max = 22
      min = 22
    }
  }
}

# Allow all traffic comming from K8s subnet
resource "oci_core_network_security_group_security_rule" "kube-apiserver" {
  network_security_group_id = oci_core_network_security_group.default_sg.id
  description               = "Allow k8s subnet all ports"
  direction                 = "INGRESS"
  source                    = oci_core_subnet.subnet.cidr_block
  protocol                  = "all" # TCP
}
