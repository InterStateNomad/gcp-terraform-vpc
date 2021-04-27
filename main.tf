terraform {
  required_version = ">= 0.14"
}

#################
# VPC
#################

resource "google_compute_network" "vpc_network" {
  name                            = var.vpc_name
  mtu                             = var.mtu
  auto_create_subnetworks         = var.auto_create
  routing_mode                    = var.routing_mode
  project                         = var.project
  delete_default_routes_on_create = var.delete_routes
}

##############
# Subnetwork
##############

resource "google_compute_subnetwork" "subnetwork" {
  name                     = var.subnetwork_name
  ip_cidr_range            = var.cidr_range
  region                   = var.region
  network                  = google_compute_network.vpc_network.name
  private_ip_google_access = var.private_access
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
}