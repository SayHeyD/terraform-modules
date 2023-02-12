output "sops_operator_sops_secret_crd" {
  value = kubectl_manifest.sops_secret_crd
  sensitive = true
}

output "sops_Age_key" {
  value = kubectl_manifest.age_key
  sensitive = true
}