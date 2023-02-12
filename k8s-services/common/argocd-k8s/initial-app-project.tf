resource "kubectl_manifest" "argocd_initial_app_project" {
  depends_on = [
    time_sleep.wait_for_api_registration
  ]

  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: ${var.app_project_name}
  namespace: ${var.app_project_namespace}
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  description: "AppProject for infrastructure applications"
  sourceRepos:
    - '*'
  destinations:
    - namespace: '*'
      server: '*'
  clusterResourceWhitelist:
    - group: '*'
      kind: '*'
  orphanedResources:
    warn: false
  YAML
}

resource "time_sleep" "wait_for_app_proj_registration" {
  depends_on = [kubectl_manifest.argocd_initial_app_project]

  create_duration = "15s"
}