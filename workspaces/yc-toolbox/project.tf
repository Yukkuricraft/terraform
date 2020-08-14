resource "google_project_service" "compute" {
  project = module.secrets.gcp_infra_project_id
  service = "compute.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "iam" {
  project = module.secrets.gcp_infra_project_id
  service = "iam.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "cloudresourcemanager" {
  project = module.secrets.gcp_infra_project_id
  service = "cloudresourcemanager.googleapis.com"

  disable_on_destroy = false
}
