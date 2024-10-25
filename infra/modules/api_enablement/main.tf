# modules/api_enablement/main.tf

resource "google_project_service" "enable_apis" {
  for_each = toset(var.api_list)
  project  = var.project_id
  service  = each.key
}

output "enabled_services" {
  value = [for service in google_project_service.enable_apis : service.service]
}
