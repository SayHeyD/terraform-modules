module "sops" {
  source = "../../k8s-services/common/sops-operator-gpg"

  k8s_host = module.do_cluster.cluster.endpoint
  k8s_token = module.do_cluster.cluster.kube_config[0].token
  k8s_cluster_ca_certificate = module.do_cluster.cluster.kube_config[0].cluster_ca_certificate

  namespace = var.sops_namespace
  sops_crd_namespace = var.sops_crd_namespace

  age_key = var.sops_age_key
}