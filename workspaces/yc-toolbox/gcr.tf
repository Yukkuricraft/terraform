resource "google_container_registry" "ycinfrabot-images" {
  project = module.secrets.gcr_project_id
}

resource "google_storage_bucket_iam_member" "ycinfrabot-sa-viewer" {
  bucket = google_container_registry.ycinfrabot-images.id
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.ycinfrabot.email}"
}
