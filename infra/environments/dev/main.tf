# environments/dev/main.tf

provider "google" {
  project = var.project_id
  region  = var.region
}


# (1) enable apis
module "api_enablement" {
  source    = "../../modules/api_enablement"
  project_id = var.project_id
  # Optionally override the list of APIs
  api_list   = [
    "cloudbuild.googleapis.com",       # Cloud Build API
    "artifactregistry.googleapis.com", # Artifact Registry API
    "iam.googleapis.com",              # IAM API
    "compute.googleapis.com",          # Compute Engine API
    "run.googleapis.com",              # Cloud Run API
    "cloudfunctions.googleapis.com",   # Cloud Functions API
    "container.googleapis.com",        # Kubernetes Engine API
    "appengine.googleapis.com",        # App Engine Admin API
    "cloudresourcemanager.googleapis.com", # Resource Manager API
    # Add or remove APIs as needed
  ]
}

# (2) vpc
module "network" {
  source         = "../../modules/network"
  vpc_name       = "dev-vpc"
  region         = var.region
  subnet_configs = var.subnet_configs
  #firewall_rules = var.firewall_rules
}

# (3) firewall rules
module "firewall_rules" {
  source       = "../../modules/firewall"
  vpc_name     = module.network.vpc_name
  firewall_rules = var.firewall_rules
}
