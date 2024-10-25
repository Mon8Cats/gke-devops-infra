# environments/dev/main.tf

provider "google" {
  project = var.project_id
  region  = var.region
}


module "api_enablement" {
  source    = "../../modules/api_enablement"
  project_id = var.project_id
  # Optionally override the list of APIs
  api_list   = [
    "cloudbuild.googleapis.com",
    "artifactregistry.googleapis.com",
    "iam.googleapis.com",
    # Add or remove APIs as needed
  ]
}

/*
module "network" {
  source         = "../../modules/network"
  vpc_name       = "dev-vpc"
  region         = var.region
  subnet_configs = var.subnet_configs
  firewall_rules = var.firewall_rules
}
*/