resource "oci_core_internet_gateway" "this" {
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_id
  display_name   = var.display_name
  enabled     = var.enabled
}