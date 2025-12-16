resource "oci_containerengine_cluster" "this" {
    compartment_id = var.compartment_ocid
    name = var.oke_cluster_name
    vcn_id = var.vcn_id
    kubernetes_version = var.kubernetes_version

    endpoint_config {
        is_public_ip_enabled = var.is_public_ip_enabled
        subnet_id = var.kubernetes_endpoint_subnet_id
    }

    options {
        service_lb_subnet_ids = var.service_lb_subnet_ids
    }
}