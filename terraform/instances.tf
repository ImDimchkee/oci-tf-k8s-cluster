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
    source_id               = "ocid1.image.oc1.uk-london-1.aaaaaaaaffyd5ugacgskn5vyd4vn7tjkahvb5wmcyxzzhobfw3egnrmhqqaq"
    boot_volume_size_in_gbs = "50"

  }

  create_vnic_details {
    subnet_id = oci_core_subnet.subnet.id
  }

  metadata = {
    "ssh_authorizerd_keys" = local.ssh_authorized_keys
  }

}

