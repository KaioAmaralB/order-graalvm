variable "compartment_ocid" {
  description = "The OCID of the compartment where the Internet Gateway will be created"
  type        = string
}

variable "vcn_id" {
  description = "The OCID of the VCN to attach the Internet Gateway"
  type        = string
}

variable "display_name" {
  description = "The display name for the Internet Gateway"
  type        = string
}

variable "enabled" {
  description = "Whether the gateway is enabled. When the gateway is disabled, traffic is not routed to/from the Internet, regardless of route rules"
  type        = bool
}
