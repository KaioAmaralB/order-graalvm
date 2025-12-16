output "node_pool_id" {
  value       = oci_containerengine_node_pool.pool.id
  description = "OCID do node pool criado"
}

output "node_pool_name" {
  value       = oci_containerengine_node_pool.pool.name
  description = "Nome do node pool criado"
}

output "node_pool_kubernetes_version" {
  value       = oci_containerengine_node_pool.pool.kubernetes_version
  description = "Versão do Kubernetes usada no node pool"
}

output "node_pool_nodes" {
  value       = oci_containerengine_node_pool.pool.nodes
  description = "Lista de instâncias criadas como nós do cluster"
}

output "node_pool_placement_configs" {
  value       = oci_containerengine_node_pool.pool.node_config_details[0].placement_configs
  description = "Configurações de AD/Subnet onde os nós foram criados"
}
