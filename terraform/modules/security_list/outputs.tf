output "security_list_id" {
  description = "OCID da Security List"
  value       = oci_core_security_list.this.id
}
