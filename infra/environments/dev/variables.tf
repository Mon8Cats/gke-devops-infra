variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region for the resources"
  type        = string
}

variable "subnet_configs" {
  description = "Configurations for each subnet"
  type = list(object({
    name = string
    cidr = string
  }))
}


variable "firewall_rules" {
  description = "Configurations for firewall rules"
  type = list(object({
    name     = string
    protocol = string
    ports    = list(string)
  }))
}
