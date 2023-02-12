resource "kubectl_manifest" "sops_secret_crd" {
  override_namespace = var.sops_crd_namespace

  yaml_body = file("${path.module}/configs/crd.yaml")
}