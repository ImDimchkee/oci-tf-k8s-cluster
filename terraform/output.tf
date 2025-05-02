data "oci_load_balancer_shapes" "loadbalancer_shapes" {
  compartment_id = var.compartment_id
}

output "loadbalancer_shapes" {
  value = data.oci_load_balancer_shapes.loadbalancer_shapes
}
