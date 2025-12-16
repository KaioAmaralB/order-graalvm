variable "compartment_ocid" {
  type        = string
  description = "OCID do compartment onde o repositório OCIR será criado."
}

variable "repo_name" {
  type        = string
  description = "Nome do repositório OCIR (apenas o nome, sem o namespace)."
}

variable "is_public" {
  type        = bool
  description = "Define se o repositório será público (true) ou privado (false)."
}
