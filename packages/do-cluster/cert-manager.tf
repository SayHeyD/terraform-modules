module "cert_manager_lets_encrypt" {

  source = "../../k8s-services/common/cert-manager-lets-encrypt"

  k8s_host = module.do_cluster.cluster.endpoint
  k8s_token = module.do_cluster.cluster.kube_config[0].token
  k8s_cluster_ca_certificate = module.do_cluster.cluster.kube_config[0].cluster_ca_certificate

  acme_registration_email = var.acme_registration_email

  ingress_class = "nginx"
}