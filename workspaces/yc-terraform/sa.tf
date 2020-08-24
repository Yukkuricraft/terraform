resource "google_service_account" "yc-terraform-bot" {
  account_id   = "yc-terraform-bot"
  display_name = "YC Terraform Bot"
  project      = google_project.yc-terraform.project_id
}
