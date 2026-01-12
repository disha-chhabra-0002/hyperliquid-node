resource "google_compute_address" "static_external_ip" {
  name         = var.name
  address_type = var.address_type
  ip_version   = var.ip_version
  region       = var.region
}
