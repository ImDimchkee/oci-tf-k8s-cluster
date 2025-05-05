# Security Group that contains fw rules
resource "oci_core_network_security_group" "default_sg" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
}

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

resource "oci_core_network_security_group_security_rule" "kube-apiserver" {
  network_security_group_id = oci_core_network_security_group.default_sg.id
  description               = "Allow apiserver port ingress from k8s subnet"
  direction                 = "INGRESS"
  source                    = oci_core_subnet.subnet.cidr_block
  protocol                  = "all" # TCP
}

# resource "oci_core_security_list" "name" {
#   compartment_id = var.compartment_id
#   vcn_id         = oci_core_vcn.vcn.id

#   ingress_security_rules {
#     description = "Allow HTTP"
#     protocol    = "6"
#     source      = "0.0.0.0/0"
#     tcp_options {
#       min = 80
#       max = 80
#     }
#   }
#   ingress_security_rules {
#     description = "Allow HTTPS"
#     protocol    = "6"
#     source      = "0.0.0.0/0"
#     tcp_options {
#       min = 443
#       max = 443
#     }
#   }
#   ingress_security_rules {
#     description = "Allow Internal"
#     protocol    = "all"
#     source      = var.subnet_cidr
#   }
# }


# resource "oci_core_network_security_group_security_rule" "allow_all_ingress" {
#   network_security_group_id = oci_core_network_security_group.default_sg.id
#   direction                 = "INGRESS"
#   source                    = "0.0.0.0/0"
#   protocol                  = "all"
# }
