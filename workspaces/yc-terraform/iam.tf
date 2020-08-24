resource "google_project_iam_binding" "project_owners" {
  project = google_project.yc-terraform.project_id
  role    = "roles/owner"
  members = [
    "serviceAccount:${google_service_account.yc-terraform-bot.email}",
    "user:remi@yukkuricraft.net"
  ]
}
