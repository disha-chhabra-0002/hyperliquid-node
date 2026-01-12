resource "google_compute_firewall" "general" {
  name    = "${var.vpc_name}-hyperliquid-node"

  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["4001" , "4002" , "3001", "22" ,  "9100"]
  }


  source_ranges = ["0.0.0.0/0"]
}