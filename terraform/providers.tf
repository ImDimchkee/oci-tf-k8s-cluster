terraform {
  required_providers {
   oci = {
      source = "oracle/oci"
      version = ">=6.37.0"
   } 
  }
}

# Oracle Cloud Infrastructure (OCI) provider configuration
provider "oci" {
  auth             = "APIKey"
  tenancy_ocid     = var.compartment_id
  user_ocid        = var.user_ocid
  private_key_path = var.private_key_path
  fingerprint      = var.fingerprint

  region = var.region
}

