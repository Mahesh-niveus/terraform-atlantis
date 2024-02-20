terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.40.0"
    }
  }
}
provider "google" {
  project     = "prj-hotelogic-poc-01-22106"
  region      = "asia-south1"
}

resource "google_compute_instance" "default" {
  name         = "test-vm-02"
  machine_type = "e2-micro"
  
  zone         = "asia-south1-c"
  tags = ["dev", "engineering"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20221014"
      labels = {
        env = "dev"
      }
    }
  }

  network_interface {
    subnetwork = "projects/prj-hotelogic-poc-01-22106/regions/asia-south1/subnetworks/sb-as1-ov-03"
    access_config {
      // Ephemeral public IP
    }
  }
}
