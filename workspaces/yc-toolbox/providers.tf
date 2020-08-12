provider "google" {
  project     = module.secrets.gcp_infra_project_id
  region      = module.secrets.gcp_region
  credentials = "../../modules/secrets/yc_tf_gcs_sa.json"
}
