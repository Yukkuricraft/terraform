resource "google_project" "yc-terraform" {
  name            = "YC Terraform"
  project_id      = "yc-terraform"
  org_id          = module.secrets.gcp_organization_id
  billing_account = module.secrets.gcp_billing_account_id
}

resource "google_project_service" "cloudbilling" {
  project = google_project.yc-terraform.project_id
  service = "cloudbilling.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "iam" {
  project = google_project.yc-terraform.project_id
  service = "iam.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "cloudresourcemanager" {
  project = google_project.yc-terraform.project_id
  service = "cloudresourcemanager.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "serviceusage" {
  project = google_project.yc-terraform.project_id
  service = "serviceusage.googleapis.com"

  disable_on_destroy = false
}
