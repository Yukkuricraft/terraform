terraform {
  backend "gcs" {
    bucket      = "yc-terraform-states"
    prefix      = "states/yc-terraform/"
    credentials = "../../modules/secrets/yc_tf_gcs_sa.json"
  }
}
