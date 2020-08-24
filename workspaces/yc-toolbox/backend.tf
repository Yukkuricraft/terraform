terraform {
  backend "gcs" {
    bucket      = "yc-terraform-states"
    prefix      = "states/yc-toolbox/"
    credentials = "../../modules/secrets/yc_tf_gcs_sa.json"
  }
}
