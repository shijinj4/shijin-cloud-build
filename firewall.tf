resource "google_compute_firewall" "flask_app_fw" {
  name    = "flask-app-firewall"
  network = google_compute_network.vpc.id

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }

  source_ranges = ["0.0.0.0/0"]
}
