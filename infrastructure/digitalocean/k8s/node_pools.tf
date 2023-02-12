locals {
  additional_nodes = length(var.node_pools) > 1 ? slice(var.node_pools, 1, length(var.node_pools)) : []
}

resource "digitalocean_kubernetes_node_pool" "additional_nodes" {
  cluster_id = digitalocean_kubernetes_cluster.cluster.id

  for_each = {for additional_node in local.additional_nodes: additional_node.name => additional_node}

  name       = each.key
  size       = each.value.size
  node_count = each.value.node_count

  auto_scale = each.value.auto_scale
  min_nodes = each.value.min_nodes
  max_nodes = each.value.max_nodes
  tags = each.value.tags
  labels = each.value.labels

  dynamic "taint" {
    for_each = each.value.taint == null ? [] : list(each.value.taint)

    content {
      key    = each.value.taint.key
      value  = each.value.taint.value
      effect = each.value.taint.effect
    }
  }
}