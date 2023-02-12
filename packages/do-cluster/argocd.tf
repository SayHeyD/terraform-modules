module "argocd" {
  source = "../../k8s-services/common/argocd-k8s"

  k8s_host = module.do_cluster.cluster.endpoint
  k8s_token = module.do_cluster.cluster.kube_config[0].token
  k8s_cluster_ca_certificate = module.do_cluster.cluster.kube_config[0].cluster_ca_certificate

  argocd_values = var.argocd_helm_values_files

  application_name = var.application_name
  application_namespace = var.application_namespace
  application_project = var.app_project_name

  https_repo_url = var.https_repo_url
  target_revision = var.target_revision
  applicaiton_path = var.applicaiton_path

  application_destination_namespace = var.application_destination_namespace

  app_project_name = var.app_project_name
  app_project_namespace = var.app_project_namespace
}