variable "compartment_ocid" {
  description = "OCID do compartment onde a subnet será criada"
  type        = string
}

variable "vcn_id" {
  description = "OCID da VCN associada à subnet"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block da subnet (ex: 10.1.1.0/24)"
  type        = string
}

variable "subnet_display_name" {
  description = "Nome da subnet"
  type        = string
}

variable "prohibit_public_ip_on_vnic" {
  description = "Subnet pública ou privada"
  type        = bool
}

variable "route_table_id" {
  description = "ID da Route Table associada à subnet"
  type        = string
}

variable "security_list_ids" {
  description = "Lista de Security Lists associadas"
  type        = list(string)
}
