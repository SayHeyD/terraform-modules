resource "helm_release" "argocd_chart" {
  name       = "argocd"
  namespace  = var.namespace
  create_namespace = var.create_namespace

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  values = var.argocd_values
}

resource "time_sleep" "wait_for_api_registration" {
  depends_on = [helm_release.argocd_chart]

  create_duration = "30s"
}