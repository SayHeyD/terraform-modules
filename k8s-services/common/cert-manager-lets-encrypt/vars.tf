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
  description = "The namespace where the cert-manager chart will be deployed"
  default = "cert-manager"
}

variable "create_namespace" {
  type = bool
  description = "Should the namespace be created by helm"
  default = true
}

variable "cert_manager_values" {
  type = list(string)
  description = "The values file for argocd"
  default = []
}

variable "acme_registration_email" {
  type = string
  description = "Your email used for the ACME registration"
  nullable = false
}

variable "ingress_class" {
  type = string
  description = "The ingress class used for acme"
  nullable = false
}