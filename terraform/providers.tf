# Oracle Cloud Infrastructure (OCI) provider configuration
provider "oci" {
   auth = "InstancePrincipal"
   region = var.region
}
