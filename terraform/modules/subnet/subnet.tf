resource "oci_core_subnet" "this" {
  compartment_id      = var.compartment_ocid
  vcn_id              = var.vcn_id
  cidr_block          = var.subnet_cidr_block
  display_name        = var.subnet_display_name
  prohibit_public_ip_on_vnic = var.prohibit_public_ip_on_vnic
  route_table_id      = var.route_table_id
  security_list_ids   = var.security_list_ids
}
