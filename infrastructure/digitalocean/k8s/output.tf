output "cluster" {
  value = digitalocean_kubernetes_cluster.cluster
}

output "node_pools" {
  value = digitalocean_kubernetes_node_pool.additional_nodes
}