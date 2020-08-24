terraform {
  backend "gcs" {
    bucket      = "yc-tf-states"
    prefix      = "states/yc-discourse/"
    credentials = "../../modules/secrets/yc_tf_gcs_sa.json"
  }
}
