# Configure the Google Cloud provider
provider "google" {
  project = "web-demo-470508"
  region  = "us-central1"
  zone    = "us-central1-a"
}

# Create a network
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

# Create a firewall rule
resource "google_compute_firewall" "default" {
  name    = "terraform-allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Allow SSH from everywhere (not secure, but works for demo)
  source_ranges = ["0.0.0.0/0"]
}

# Create a VM instance
resource "google_compute_instance" "default" {
  name         = "terraform-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {} # This gives a public IP
  }
}

