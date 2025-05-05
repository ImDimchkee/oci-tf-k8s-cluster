locals {
  ssh_authorized_keys = file("~/.ssh/id_ed25519.pub")
}

resource "oci_core_instance" "worker" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id

  count = var.worker_count

  shape = var.insatnce_shape
  shape_config {
    ocpus         = 1
    memory_in_gbs = 8
  }

  display_name = "k8-worker-${count.index + 1}"
  source_details {
    source_type             = "image"
    source_id               = var.source_id
    boot_volume_size_in_gbs = "50"
  }

  create_vnic_details {
    subnet_id  = oci_core_subnet.subnet.id
    nsg_ids    = [oci_core_network_security_group.default_sg.id]
    private_ip = "10.0.1.10${count.index}"
  }

  metadata = {
    "ssh_authorized_keys" = local.ssh_authorized_keys
  }

}

resource "oci_core_instance" "master" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id

  count = var.master_count

  shape = var.insatnce_shape
  shape_config {
    ocpus         = 2
    memory_in_gbs = 8
  }

  display_name = "k8-master-1"
  source_details {
    source_type = "image"
    source_id   = var.source_id
  }

  create_vnic_details {
    subnet_id  = oci_core_subnet.subnet.id
    nsg_ids    = [oci_core_network_security_group.default_sg.id]
    private_ip = "10.0.1.10"
  }

  metadata = {
    "ssh_authorized_keys" = local.ssh_authorized_keys
  }

}
