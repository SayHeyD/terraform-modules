variable "do_token" {
  type = string
  description = "APi token for digitalocean"
  nullable = false
}

variable "cluster_id" {
  type = string
  description = "Id of the cluster"
  nullable = false
}

variable "cluster_name" {
  type = string
  description = "Name of the cluster"
  nullable = false
}

variable "namespace" {
  type = string
  description = "The namespace name of the ingress controller"
  default = "nginx-ingress-controller"
}