resource "kubectl_manifest" "age_key" {
  override_namespace = var.namespace

  yaml_body = var.age_key
}