provider "google" {
  project = module.secrets.gcp_infra_project_id
  region  = module.secrets.gcp_region
}
