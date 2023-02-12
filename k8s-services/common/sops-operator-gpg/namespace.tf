resource "kubernetes_namespace" "sops" {
  metadata {
    name = var.namespace
  }
}