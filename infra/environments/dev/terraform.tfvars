# environments/dev/terraform.tfvars

project_id = "mon-infra-439715"
region     = "us-central1"

subnet_configs = [
  {
    name = "dev-subnet-1"
    cidr = "10.0.1.0/24"
  },
  {
    name = "dev-subnet-2"
    cidr = "10.0.2.0/24"
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
