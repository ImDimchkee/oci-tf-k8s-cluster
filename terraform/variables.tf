# Global
variable "region" {
  description = "Default region for all resources"
  type        = string
}

variable "availability_domain" {
  description = "Availability domain for all resources"
  type        = string
}

variable "compartment_id" {
  description = "Compartment ID to deploy resources in"
  type        = string
}

# Provider Auth
variable "user_ocid" {
  description = "User Oracle Cloud ID for authentication"
  type        = string
}

variable "private_key_path" {
  description = "Path to the OCI APIKey .pem key"
  type        = string
}

variable "fingerprint" {
  description = "Finger print of the APIKey"
  type        = string
}

# Compute instances
variable "worker_count" {
  description = "Set number values to deploy that number of workers"
  type        = number
}

variable "master_count" {
  description = "Number of k8s masters"
  type        = number
}

variable "insatnce_shape" {
  description = "Instance shape"
  type        = string
}

# Image OCID
variable "source_id" {
  description = "value"
  type        = string
}

# Networking
variable "vcn_cidr" {
  description = "value"
  type        = list(string)
}

variable "subnet_cidr" {
  description = "value"
  type        = string
}

# Not used yet
variable "lb_shape" {
  description = "Load balancer shape"
  type        = string
}

variable "lb_displayname" {
  description = "Load balancer display name"
  type        = string
}

# IP Whitelist
variable "ip_map" {
  description = "value"
  type = object({
    home_ip = string
    worker1 = string
    worker2 = string
    master  = string
  })
}

# SSH Public key for direct instance access
variable "path_to_ssh_pub_key" {
  description = "Absolute path of public key file to add to the servers"
  type        = string
}
