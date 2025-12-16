variable "compartment_ocid" {
  type        = string
  description = "Compartment do node pool"
}

variable "subnet_id" {
  type        = string
  description = "Subnet onde os nós serão provisionados"
}

variable "cluster_id" {
  type        = string
  description = "OCID do cluster OKE"
}

variable "kubernetes_version" {
  type        = string
  description = "Versão do Kubernetes a ser usada"
}

variable "image_id" {
  type        = string
  description = "OCID da imagem dos workners nodes"
}
