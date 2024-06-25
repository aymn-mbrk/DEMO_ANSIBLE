provider "google" {
  project = "positive-rush-426912-h6"
  region  = "europe-west9"
  zone    = "europe-west9-a"
}

resource "google_compute_instance" "vm" {
  count        = 3
  name         = "${element(["db", "web1", "web2"], count.index)}"
  machine_type = "n2-standard-2"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}

output "instance_ips" {
  value = { for i in google_compute_instance.vm : i.name => i.network_interface[0].access_config[0].nat_ip }
  description = "The public IP addresses of the VM instances, mapped by name"
}
