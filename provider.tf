provider "google" {
  credentials = file("my-new-project-405301-945c62d889d6.json")
  project     = "my-new-project-405301"
  region      = "us-east1"
  zone        = "us-east1-b"
}
