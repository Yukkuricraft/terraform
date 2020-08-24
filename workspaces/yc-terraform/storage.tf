resource "google_storage_bucket" "yc-tf-states" {
  name    = "yc-terraform-states"
  project = google_project.yc-terraform.project_id

  location = "US"
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_member" "yc-tf-states-sa-admin" {
  bucket = google_storage_bucket.yc-tf-states.self_link
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.yc-terraform-bot.email}"
}
