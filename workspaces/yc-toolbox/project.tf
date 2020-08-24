resource "google_project" "yc-toolbox" {
  name            = "YC Toolbox Infra"
  project_id      = "yc-toolbox"
  org_id          = module.secrets.gcp_organization_id
  billing_account = module.secrets.gcp_billing_account_id
}

resource "google_project_service" "containerregistry" {
  project = google_project.yc-toolbox.project_id
  service = "containerregistry.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "compute" {
  project = google_project.yc-toolbox.project_id
  service = "compute.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "iam" {
  project = google_project.yc-toolbox.project_id
  service = "iam.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "cloudresourcemanager" {
  project = google_project.yc-toolbox.project_id
  service = "cloudresourcemanager.googleapis.com"

  disable_on_destroy = false
}
