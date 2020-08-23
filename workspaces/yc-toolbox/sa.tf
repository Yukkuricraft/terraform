resource "google_service_account" "ycinfrabot" {
  account_id   = "ycinfrabot"
  display_name = "YC RemiBot"
}

resource "google_project_iam_binding" "compute-access" {
  project = module.secrets.gcp_infra_project_id
  role    = "roles/compute.instanceAdmin"

  members = [
    "serviceAccount:${google_service_account.ycinfrabot.email}"
  ]
}
