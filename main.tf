terraform {
  required_version = "0.14.9"
  required_providers {
    google = {
      source  = "hashicorp/google"
      project = var.project_id
      version = "3.64.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      project = var.project_id
      version = "3.64.0"
    }
  }
}

#################
# VPC
#################

resource "google_compute_network" "vpc_network" {
  name                            = var.vpc_name
  mtu                             = var.mtu
  auto_create_subnetworks         = var.auto_create
  routing_mode                    = var.routing_mode
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
}