terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.1"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_kubernetes_cluster" "primary" {
  name = var.cluster_name
  depends_on = [
    var.cluster_id
  ]
}

provider "helm" {
  kubernetes {
    host = data.digitalocean_kubernetes_cluster.primary.endpoint

    # client_certificate     = data.digitalocean_kubernetes_cluster.primary.kube_config[0].client_certificate
    # client_key             = data.digitalocean_kubernetes_cluster.primary.kube_config[0].client_key
    token                    = data.digitalocean_kubernetes_cluster.primary.kube_config[0].token
    cluster_ca_certificate = base64decode(
      data.digitalocean_kubernetes_cluster.primary.kube_config[0].cluster_ca_certificate
    )
  }
}

resource "helm_release" "nginx_ingress_controller" {
  name       = "nginx-ingress-controller"
  namespace  = var.namespace
  create_namespace = true

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "service.annotations.service\\.beta\\.kubernetes\\.io/do-loadbalancer-name"
    value = format("%s-nginx-ingress", var.cluster_name)
  }
}