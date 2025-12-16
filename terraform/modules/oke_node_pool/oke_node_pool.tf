resource "oci_containerengine_node_pool" "pool" {
  name               = "np-${terraform.workspace}"
  compartment_id     = var.compartment_ocid
  cluster_id         = var.cluster_id
  kubernetes_version = var.kubernetes_version
  node_shape         = "VM.Standard.E4.Flex"

  node_shape_config {
    ocpus         = 2
    memory_in_gbs = 16
  }

  node_config_details {
    size = 2
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      subnet_id           = var.subnet_id
    }
  }

  node_source_details {
    source_type = "IMAGE"
    image_id = var.image_id
  }
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

data "oci_containerengine_node_pool_option" "pool_option" {
  node_pool_option_id = var.cluster_id
  compartment_id      = var.compartment_ocid
}
