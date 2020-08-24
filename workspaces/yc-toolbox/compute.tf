data "template_file" "cloud-init" {
  template = "${file("templates/cloud-init.yml.tpl")}"

  vars = {
    gcr_project_id = google_project.yc-toolbox.project_id
    gcr_image_name = module.secrets.gcr_image_name
    gcr_image_tag  = module.secrets.gcr_image_tag
  }
}

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
