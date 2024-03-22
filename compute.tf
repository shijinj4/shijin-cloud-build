resource "google_compute_instance" "flask_app" {
  name         = "flask-app-instance"
  machine_type = "e2-medium"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.public_subnet.id
    access_config {
      // Empty block to assign a public IP address
    }
  }

  metadata = {
    gce-container-declaration = <<-EOT
spec:
  containers:
    - name: flask-app
      image: gcr.io/my-new-project-405301/flask-backend:latest
      ports:
        - containerPort: 5000
  restartPolicy: Always
EOT
  }

  service_account {
    scopes = ["cloud-platform"]
  }
}
