provider "google" {
  project     = "yc-toolbox"
  region      = module.secrets.gcp_region
  credentials = "../../modules/secrets/yc_tf_gcs_sa.json"
}
