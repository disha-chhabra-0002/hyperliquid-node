variable "name" {}
variable "machine_type" {}
variable "zone" {}
variable "image" {}
variable "network" {}
variable "subnet" {}
variable "tags" {
   type = list(string)
}

variable "script" {}
variable "disk_size" {}
variable "ip_address" {}