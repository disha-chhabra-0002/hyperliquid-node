module "network" {
  source     = "./modules/network"
  project_id = var.project_id
  region     = var.region
  vpc_name   = "${var.env}-hyperliquid-vpc-3"

  subnets = [
  { name = "${var.env}-hyperliquid-subnet-11", cidr_range = "10.10.1.0/24" }
]
}

module "node-static-ip" {
    source = "./modules/ip"
    name = "node-static-ip-1"
    address_type = "EXTERNAL"
    ip_version   = "IPV4"
    region       = var.region
}


module "node-1" {
  source       = "./modules/compute"
  name         = "hyperliquid-node"
  machine_type = "n2-standard-8"
  zone         = var.zone
  image        = "ubuntu-minimal-2204-lts"
  network      = module.network.vpc_name
  subnet       = element(module.network.subnet_names, 0)  # gets the first subnet_names
  tags         =["hyperliquid-node"]
  disk_size    = 500    
  ip_address   = module.node-static-ip.ip_address                
}