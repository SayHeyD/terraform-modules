output "do_cluster" {
  value = module.do_cluster
  sensitive = true
}

output "nginx_ingress" {
  value = module.nginx_ingress
  sensitive = true
}

output "argocd" {
  value = module.argocd
  sensitive = true
}

output "cert_manager_lets_encrypt" {
  value = module.cert_manager_lets_encrypt
  sensitive = true
}