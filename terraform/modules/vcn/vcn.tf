resource "oci_core_virtual_network" "this" {
  compartment_id = var.compartment_ocid
  cidr_block     = var.vcn_cidr_block
  display_name   = var.vcn_display_name
}
