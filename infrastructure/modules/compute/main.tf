resource "google_compute_instance" "this" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size          # GB
      type  = "pd-ssd" 
    }
  }
  tags= var.tags

  network_interface {
    network    = var.network  # use module.network.vpc_name
    subnetwork = var.subnet   # use module.network.subnet_names
    access_config {
        nat_ip = var.ip_address
    }  # gives external IP
  }

 #  metadata_startup_script = var.script
}