# VCN
module "vcn_graalvm" {
  source           = "../../modules/vcn"
  compartment_ocid = var.compartment_ocid
  vcn_cidr_block   = "10.2.0.0/16"
  vcn_display_name = "vcn_graalvm"
}

# Subnet
module "subnet_oke_graalvm" {
  source                     = "../../modules/subnet"
  compartment_ocid           = var.compartment_ocid
  vcn_id                     = module.vcn_graalvm.vcn_id
  subnet_cidr_block          = "10.2.1.0/24"
  subnet_display_name        = "subnet_oke_graalvm"
  prohibit_public_ip_on_vnic = false
  route_table_id             = module.route_table_graalvm.route_table_id
  security_list_ids          = [module.security_list_graalvm.security_list_id]
}

# Subnet
module "subnet_lb_graalvm" {
  source                     = "../../modules/subnet"
  compartment_ocid           = var.compartment_ocid
  vcn_id                     = module.vcn_graalvm.vcn_id
  subnet_cidr_block          = "10.2.2.0/24"
  subnet_display_name        = "subnet_lb_graalvm"
  prohibit_public_ip_on_vnic = false
  route_table_id             = module.route_table_graalvm.route_table_id
  security_list_ids          = [module.security_list_graalvm.security_list_id]
}

#Internet Gateway
module "internet_gateway_graalvm" {
  source           = "../../modules/internet_gateway"
  compartment_ocid = var.compartment_ocid
  vcn_id           = module.vcn_graalvm.vcn_id
  display_name     = "internet_gateway_graalvm"
  enabled          = true
}

#Route Table
module "route_table_graalvm" {
  source           = "../../modules/route_table"
  compartment_ocid = var.compartment_ocid
  vcn_id           = module.vcn_graalvm.vcn_id
  display_name     = "rt_graalvm"

  route_rules = [
    {
      destination       = "0.0.0.0/0"
      destination_type  = "CIDR_BLOCK"
      network_entity_id = module.internet_gateway_graalvm.internet_gateway_id
    }
  ]
}

#Security List
module "security_list_graalvm" {
  source           = "../../modules/security_list"
  compartment_ocid = var.compartment_ocid
  vcn_id           = module.vcn_graalvm.vcn_id
  display_name     = "sl_graalvm"

  ingress_rules = [
    {
      protocol    = "all"
      source      = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
    }
  ]

  egress_rules = [
    {
      protocol         = "all"
      destination      = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
    }
  ]
}

#OCIR
module "ocir_repository_graalvm" {
  source           = "../../modules/ocir_repository"
  compartment_ocid = var.compartment_ocid
  repo_name        = "ocir_graalvm"
  is_public        = true
}

#OKE
module "oke_cluster_graalvm" {
  source                        = "../../modules/oke_cluster"
  oke_cluster_name              = "oke_graalvm"
  is_public_ip_enabled          = true
  kubernetes_endpoint_subnet_id = module.subnet_oke_graalvm.subnet_id
  service_lb_subnet_ids         = [module.subnet_lb_graalvm.subnet_id]
  compartment_ocid              = var.compartment_ocid
  vcn_id                        = module.vcn_graalvm.vcn_id
  kubernetes_version            = "v1.33.1"
}

module "oke_node_pool_graalvm" {
  source             = "../../modules/oke_node_pool"
  compartment_ocid   = var.compartment_ocid
  subnet_id          = module.subnet_oke_graalvm.subnet_id
  cluster_id         = module.oke_cluster_graalvm.cluster_id
  image_id           = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaiycdlrwxs6zmlm5yifnb3gx43xpwmp3oivq7hpyule7f4mlqshzq"
  kubernetes_version = "v1.33.1"
}
