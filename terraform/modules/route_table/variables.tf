variable "compartment_ocid" {
  description = "OCID do compartimento"
  type        = string
}

variable "vcn_id" {
  description = "OCID da VCN"
  type        = string
}

variable "display_name" {
  description = "Nome da route table"
  type        = string
}

variable "route_rules" {
  description = "Lista de regras de rota"
  type = list(object({
    destination        = string
    destination_type   = string
    network_entity_id  = string
  }))
  default = []
}
