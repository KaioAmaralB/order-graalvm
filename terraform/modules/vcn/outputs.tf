output "vcn_id" {
  description = "The OCID of the VCN"
  value       = oci_core_virtual_network.this.id
}

output "vcn_cidr_block" {
  description = "The CIDR block of the VCN"
  value       = oci_core_virtual_network.this.cidr_block
}

output "default_route_table_id" {
  description = "Default route table ID associated with the VCN"
  value       = oci_core_virtual_network.this.default_route_table_id
}

output "default_security_list_id" {
  description = "Default security list ID associated with the VCN"
  value       = oci_core_virtual_network.this.default_security_list_id
}