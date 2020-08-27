data "template_file" "cloud-init" {
  template = "${file("templates/cloud-init.yml.tpl")}"

  vars = {
    gcr_project_id = google_project.yc-toolbox.project_id
    gcr_image_name = module.secrets.gcr_image_name
    gcr_image_tag  = module.secrets.gcr_image_tag
  }
}

### Toolbox

# Toolbox is a simple COS instance running various docker images as tooling.
resource "google_compute_instance" "yc-toolbox" {
  name         = "yc-toolbox"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  project      = google_project.yc-toolbox.project_id

  tags = ["allow-ssh-2222"]

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-beta-81-12871-117-0"
      type  = "pd-standard"
      size  = "25"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
      // Static IP in the future depending??
    }
  }

  service_account {
    email  = google_service_account.yc-infra-bot.email
    scopes = ["cloud-platform"]
  }

  metadata = {
    user-data = "${data.template_file.cloud-init.rendered}"
  }
}

### Sandbox

# Sandbox is the host containing a "dev YC" environment for non-sysadmins to practice and learn linux
# Can probably make these into modules? TODO.
resource "google_compute_instance" "yc-sandbox" {
  name         = "yc-sandbox"
  machine_type = "n1-highcpu-2"
  zone         = "us-central1-a"
  project      = google_project.yc-toolbox.project_id

  tags = ["allow-ssh-2222"]

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = module.secrets.gcp_custom_yc_toolbox_image_uri
      type  = "pd-standard"
      size  = "50"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
      // Static IP in the future depending??
    }
  }

  service_account {
    email  = google_service_account.yc-infra-bot.email
    scopes = ["cloud-platform"]
  }
}
