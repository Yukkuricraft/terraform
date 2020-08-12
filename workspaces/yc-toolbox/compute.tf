data "template_file" "cloud-init" {
  template = "${file("templates/cloud-init.yml.tpl")}"

  vars = {
    gcr_project = module.secrets.gcr_project
    gcr_image   = module.secrets.gcr_image_name
    gcr_tag     = module.secrets.gcr_image_tag
  }
}

resource "google_compute_instance" "yc-toolbox" {
  name         = "yc-toolbox"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  tags = ["allow-ssh-2222"]

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

  metadata = {
    user-data = "${data.template_file.cloud-init.rendered}"
  }
}
