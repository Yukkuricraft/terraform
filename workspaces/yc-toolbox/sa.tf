resource "google_service_account" "yc-infra-bot" {
  account_id   = "yc-infra-bot"
  display_name = "YC RemiBot"
  project      = google_project.yc-toolbox.project_id
}

resource "google_project_iam_binding" "yc-infra-bot_compute-admin" {
  project = google_project.yc-toolbox.project_id
  role    = "roles/compute.instanceAdmin"

  members = [
    "serviceAccount:${google_service_account.yc-infra-bot.email}"
  ]
}
