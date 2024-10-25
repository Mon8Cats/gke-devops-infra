# environments/dev/terraform.tfvars

project_id = "mon-infra-439715"
region     = "us-central1"

subnet_configs = [
  {
    name = "dev-subnet-1"
    cidr = "10.0.1.0/24"
    region      = "us-central1"           # Add the region attribute here
    description = "Development subnet 1"  # Optional description
  },
  {
    name = "dev-subnet-2"
    cidr = "10.0.2.0/24"
    region      = "us-central1"           # Add the region attribute here
    description = "Development subnet 2"  # Optional description
  }
]

firewall_rules = [
  {
    name     = "allow-ssh"
    protocol = "tcp"
    ports    = ["22"]
  },
  {
    name     = "allow-http"
    protocol = "tcp"
    ports    = ["80"]
  }
]
