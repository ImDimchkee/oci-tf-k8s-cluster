# Oracle Cloud Infrastructure (OCI) provider configuration
provider "oci" {
   auth = "APIKey"
   tenancy_ocid = var.tenancy_ocid
   user_ocid = var.user_ocid
   private_key_path = var.private_key_path
   fingerprint = var.fingerprint

   region = var.region
}
