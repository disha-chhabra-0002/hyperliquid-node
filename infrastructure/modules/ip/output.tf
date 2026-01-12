output "ip_address" {
    value= google_compute_address.static_external_ip.address
}