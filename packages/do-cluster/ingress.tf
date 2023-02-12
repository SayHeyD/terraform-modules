module "nginx_ingress" {
  source = "../../k8s-services/digitalocean/nginx-ingress-controller-do-k8s"

  do_token = var.do_token
  cluster_id = module.do_cluster.cluster.id
  cluster_name = module.do_cluster.cluster.name
  namespace = var.ingress_controller_namespace
}