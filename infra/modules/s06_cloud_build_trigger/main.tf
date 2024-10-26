# modules/cloud_build_trigger/main.tf


resource "google_cloudbuild_trigger" "github_trigger" {
  name        = var.trigger_name
  description = var.description
  filename    = var.build_config_file

  github {
    owner    = var.github_owner
    name     = var.github_repo
    push {
      branch = var.branch_regex
    }
    connection = var.connection_id
  }

  service_account = var.service_account_email  # Specify the service account email here
}
