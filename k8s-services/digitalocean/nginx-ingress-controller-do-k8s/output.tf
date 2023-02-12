output "nginx_ingress" {
  value = helm_release.nginx_ingress_controller
  sensitive = true
}