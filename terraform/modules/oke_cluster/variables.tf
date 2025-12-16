variable "compartment_ocid" {
  description = "OCID do Copartment onde o cluster será criado"
  type        = string
}

variable "oke_cluster_name" {
  description = "Nome do cluster Kubernetes"
  type        = string
}

variable "vcn_id" {
  description = "OCID da VCN do cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes a ser usada"
  type        = string
}

variable "is_public_ip_enabled" {
  description = "Se o endpoint do cluster será público"
  type        = bool
}

variable "kubernetes_endpoint_subnet_id" {
  type        = string
  description = "OCID da subnet onde o endpoint Kubernetes será exposto (obrigatório se IP público for habilitado)"
}

variable "service_lb_subnet_ids" {
  type        = list(string)
  description = "Lista de subnets para o Load Balancer dos serviços"
}
