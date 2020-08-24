resource "google_project" "yc-discourse" {
  name            = "YC Discourse"
  project_id      = "yc-discourse"
  org_id          = module.secrets.gcp_organization_id
  billing_account = module.secrets.gcp_billing_account_id
}

resource "google_project_service" "compute" {
  project = google_project.yc-discourse.project_id
  service = "compute.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "iam" {
  project = google_project.yc-discourse.project_id
  service = "iam.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "cloudresourcemanager" {
  project = google_project.yc-discourse.project_id
  service = "cloudresourcemanager.googleapis.com"

  disable_on_destroy = false
}
