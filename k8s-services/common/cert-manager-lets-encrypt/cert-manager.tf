resource "helm_release" "cert_manager_chart" {
  name       = "cert-manager"
  namespace  = var.namespace
  create_namespace = var.create_namespace

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"

  set {
    name = "installCRDs"
    value = "true"
  }

  values = var.cert_manager_values
}

resource "time_sleep" "wait_for_api_registration" {
  depends_on = [helm_release.cert_manager_chart]

  create_duration = "30s"
}