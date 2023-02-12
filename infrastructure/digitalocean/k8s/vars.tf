variable "do_token" {
  type = string
  description = "APi token for digitalocean"
  nullable = false
}

variable "cluster_name" {
  type = string
  description = "The name of the k8s-cluster"
  nullable = false
}

variable "region" {
  type = string
  description = "The digitalocean region where the cluster is deployed"
  nullable = false
}

variable "cluster_version" {
  type = string
  description = "Digitalocean k8s cluster version"
  # Grab the latest version slug from `doctl kubernetes options versions`
  default = "1.25.4-do.0"
}

variable "high_availability" {
  type = bool
  description = "Control plane high availability (40$/month)"
  # Grab the latest version slug from `doctl kubernetes options versions`
  default = false
}

variable "maintenance_policy" {
  type = object({
    day = string,
    start_time = string
  })
  description = "The maintenance policy for the k8s cluster control plane"
  nullable = false
}

variable "node_pools" {
  type = list(object({
    name = string,
    size = string,
    node_count = number,
    auto_scale = bool,
    min_nodes = number,
    max_nodes = number,
    tags = list(string),
    labels = map(string),
    taint = object({
      key = string,
      value = string,
      effect = string # 
    })
  }))
  description = "The node pool configuration for the k8s cluster"
  nullable = false
}