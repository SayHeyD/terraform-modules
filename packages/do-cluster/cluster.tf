module "do_cluster" {
  source = "../../infrastructure/digitalocean/k8s"

  do_token = var.do_token
  cluster_name = var.cluster_name
  region = var.region

  maintenance_policy = var.maintenance_policy

  node_pools = var.node_pools
}