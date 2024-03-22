resource "google_compute_network" "vpc" {
  name                    = "flask-app-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "flask-app-public-subnet"
  region        = "us-east1"
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.1.0/24"
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "flask-app-private-subnet"
  region        = "us-east1"
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.2.0/24"
}
