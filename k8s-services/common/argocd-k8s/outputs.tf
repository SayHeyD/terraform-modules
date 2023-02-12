output "argocd_helm_chart" {
  value = helm_release.argocd_chart
  sensitive = true
}

output "argocd_initial_app" {
  value = kubectl_manifest.argocd_initial_app
  sensitive = true
}

output "argocd_initial_app_project" {
  value = kubectl_manifest.argocd_initial_app_project
  sensitive = true
}