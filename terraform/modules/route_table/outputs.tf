output "route_table_id" {
  description = "OCID da Route Table"
  value       = oci_core_route_table.this.id
}