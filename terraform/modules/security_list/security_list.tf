resource "oci_core_security_list" "this" {
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_id
  display_name   = var.display_name

  dynamic "ingress_security_rules" {
    for_each = var.ingress_rules
    content {
      protocol    = ingress_security_rules.value.protocol
      source      = ingress_security_rules.value.source
      source_type = ingress_security_rules.value.source_type

      dynamic "tcp_options" {
        for_each = (
            contains(["6", "17"], ingress_security_rules.value.protocol) &&
            try(ingress_security_rules.value.tcp_options != null, false)
        ) ? [ingress_security_rules.value.tcp_options] : []

        content {
            min = try(tcp_options.value.min, null)
            max = try(tcp_options.value.max, null)
        }
      }
    }
  }

  dynamic "egress_security_rules" {
    for_each = var.egress_rules
    content {
      protocol         = egress_security_rules.value.protocol
      destination      = egress_security_rules.value.destination
      destination_type = try(egress_security_rules.value.destination_type, null)

      dynamic "tcp_options" {
        for_each = (
          contains(["6", "17"], egress_security_rules.value.protocol) &&
          try(egress_security_rules.value.tcp_options != null, false)
        ) ? [egress_security_rules.value.tcp_options] : []

        content {
          min = try(tcp_options.value.min, null)
          max = try(tcp_options.value.max, null)
        }
      }
    }
  }
}
