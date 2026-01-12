 terraform {
  backend "gcs" {
    bucket = "hyperliquid-node-terraform-bucket12103"
    prefix = "terraform/state"
  }
}
