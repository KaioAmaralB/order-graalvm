variable "compartment_ocid" {
  description = "The OCID of the compartment where resources will be created"
  type        = string
}

variable "description" {
  description = "The description of the group"
  type        = string
  default     = "Created by Terraform"
}
