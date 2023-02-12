resource "kubectl_manifest" "argocd_initial_app" {
  depends_on = [
    time_sleep.wait_for_app_proj_registration
  ]

  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: ${var.application_name}
  namespace: ${var.application_namespace}
spec:
  syncPolicy:
    automated:
      selfHeal: true
  project: ${var.application_project}
  source:
    repoURL: ${var.https_repo_url}
    targetRevision: ${var.target_revision}
    path: ${var.applicaiton_path}
  destination:
    server: ${var.application_destination_server}
    namespace: ${var.application_destination_namespace}
  YAML
}