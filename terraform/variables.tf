variable "region" {
  description = "Default region"
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

variable "user_ocid" {
  description = "User Oracle Cloud ID"
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

variable "worker_count" {
  description = "Set number values to deploy that number of workers"
  type        = number
}

variable "master_count" {
  description = "Number of k8s masters"
  type = number
}

variable "insatnce_shape" {
  description = "Instance shape"
  type        = string
}

variable "source_id" {
  description = "value"
  type        = string
}

variable "vcn_cidr" {
  description = "value"
  type        = list(string)
}

variable "subnet_cidr" {
  description = "value"
  type        = string
}

variable "lb_shape" {
  description = "Load balancer shape"
  type        = string
}

variable "lb_displayname" {
  description = "Load balancer display name"
  type        = string
}

variable "ip_map" {
  description = "value"
  type = object({
    home_ip = string
    worker1 = string
    worker2 = string
    master  = string
  })
}
