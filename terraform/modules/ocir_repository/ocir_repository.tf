resource "oci_artifacts_container_repository" "this" {
  compartment_id = var.compartment_ocid
  display_name   = var.repo_name
  is_public      = var.is_public
}
