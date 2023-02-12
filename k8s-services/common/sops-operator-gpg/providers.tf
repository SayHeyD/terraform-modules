terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.16.1"
    }
  }
}

provider "kubernetes" {
  host                   = var.k8s_host
  token                  = var.k8s_token
  
  cluster_ca_certificate = base64decode(
    var.k8s_cluster_ca_certificate
  )
}

provider "kubectl" {
  host                   = var.k8s_host
  token                  = var.k8s_token
  cluster_ca_certificate = base64decode(
    var.k8s_cluster_ca_certificate
  )
  
  load_config_file       = false
}