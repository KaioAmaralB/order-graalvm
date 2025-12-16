variable "compartment_ocid" {
  description = "OCID do compartimento"
  type        = string
}

variable "vcn_id" {
  description = "OCID da VCN"
  type        = string
}

variable "display_name" {
  description = "Nome da Security List"
  type        = string
}

variable "ingress_rules" {
  description = "Regras de entrada (ingress)"
  type = list(object({
    protocol     = string
    source       = string
    source_type  = string
    tcp_options  = optional(object({ min = number, max = number }))
  }))
  default = []
}

variable "egress_rules" {
  description = "Regras de saída (egress)"
  type = list(object({
    protocol          = string
    destination       = string
    destination_type  = string
    tcp_options       = optional(object({ min = number, max = number }))
  }))
  default = []
}