variable "k8s_host" {
  type = string
  description = "K8s host endpoint"
  nullable = false
}

variable "k8s_token" {
  type = string
  description = "K8s auth token"
  nullable = false
}

variable "k8s_cluster_ca_certificate" {
  type = string
  description = "K8s cluster CA cert"
  nullable = false
}

variable "namespace" {
  type = string
  description = "The namespace where argocd will be deployed"
  nullable = false
}

variable "sops_crd_namespace" {
  type = string
  description = "Namespace where sops CRDs are deployed"
  default = "sops"
}

variable "age_key" {
  type = string
  description = "The age key file"
  nullable = false
}