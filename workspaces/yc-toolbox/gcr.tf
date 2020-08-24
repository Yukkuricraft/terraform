resource "google_container_registry" "ycinfrabot-images" {
  project = google_project.yc-toolbox.project_id
}

resource "google_storage_bucket_iam_binding" "gcr-docker-image-access" {
  bucket = "artifacts.${google_project.yc-toolbox.project_id}.appspot.com"
  role   = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.yc-infra-bot.email}"
  ]
}
