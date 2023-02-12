terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name   = var.cluster_name
  region = var.region
  version = var.cluster_version

  ha = var.high_availability

  maintenance_policy {
    start_time  = var.maintenance_policy.start_time
    day         = var.maintenance_policy.day
  }

  node_pool {
    name       = var.node_pools[0].name
    size       = var.node_pools[0].size
    node_count = var.node_pools[0].node_count

    auto_scale = var.node_pools[0].auto_scale
    min_nodes = var.node_pools[0].min_nodes
    max_nodes = var.node_pools[0].max_nodes
    tags = var.node_pools[0].tags
    labels = var.node_pools[0].labels

    dynamic "taint" {
      for_each = var.node_pools[0].taint == null ? [] : list(var.node_pools[0].taint)

      content {
        key    = var.node_pools[0].taint.key
        value  = var.node_pools[0].taint.value
        effect = var.node_pools[0].taint.effect
      }
    }
  }
}