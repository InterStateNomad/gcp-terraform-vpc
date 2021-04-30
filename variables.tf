#########################
# Google Info
#########################

variable "project_id" {
  type        = string
  description = "Project ID"
}

#########################
# VPC Details
#########################

variable "vpc_name" {
  type        = string
  description = "name for the VPC Network."
}

variable "mtu" {
  type        = number
  description = "Maximum Transmission Unit in bytes."
  default     = 1460
}

variable "auto_create" {
  type        = bool
  description = "When set to true, the network is created in auto subnet mode and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in custom subnet mode so the user can explicitly connect subnetwork resources."
  default     = false
}

variable "routing_mode" {
  type        = string
  description = "The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to GLOBAL, this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are REGIONAL and GLOBAL."
  default     = "GLOBAL"
}

variable "project" {
  type        = string
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  default     = ""
}

variable "delete_routes" {
  type        = bool
  description = "If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation. Defaults to false."
  default     = false
}

####################
# Subnetwork Details
####################

variable "subnetwork_name" {
  type = string
  description = "The name of the resource, provided by the client when initially creating the resource. The name must be 1-63 characters long, and comply with RFC1035."
}

variable "cidr_range" {
  type = string
  description = "The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported."
}

variable "region" {
  type = string
  description = " The GCP region for this subnetwork."
}

variable "private_access" {
  type = bool
  description = "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
  default = false
}
