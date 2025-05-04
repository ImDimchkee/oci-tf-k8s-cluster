output "cluster_ips" {
  value = ["${oci_core_instance.worker[0].display_name}: ${oci_core_instance.worker[0].public_ip}", "${oci_core_instance.worker[1].display_name}: ${oci_core_instance.worker[1].public_ip}", "${oci_core_instance.master.display_name}: ${oci_core_instance.master.public_ip}"]
}
