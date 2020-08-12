terraform {
  backend "gcs" {
    bucket      = "yc-tfstate"
    prefix      = "states/"
    credentials = "../../modules/secrets/yc_tf_gcs_sa.json"
  }
}
