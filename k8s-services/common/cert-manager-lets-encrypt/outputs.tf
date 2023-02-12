output "cert_manager_helm_chart" {
  value = helm_release.cert_manager_chart
  sensitive = true
}

output "cluster_issuer_lets_encrypt" {
  value = kubectl_manifest.lets_encrypt
  sensitive = true
}