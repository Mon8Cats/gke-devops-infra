# modules/cloud_build_trigger/main.tf

resource "google_cloudbuild_trigger" "github_trigger" {
  name        = var.trigger_name
  description = var.description
  filename    = var.build_config_file  # Path to the cloudbuild.yaml file

  github {
    owner    = var.github_owner
    name     = var.github_repo
    push {
      branch = var.branch_regex  # Trigger on specific branches or all branches
    }
  }

  # Optional tags, substitutions, or other trigger options can be added here if needed
}
