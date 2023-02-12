terraform {
  required_version = ">= 0.13"
  
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    time = {
      source = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "helm" {
  kubernetes {
    host = var.k8s_host

    token = var.k8s_token
    cluster_ca_certificate = base64decode(
      var.k8s_cluster_ca_certificate
    )
  }
}

provider "kubectl" {
  host = var.k8s_host

  token = var.k8s_token
  cluster_ca_certificate = base64decode(
    var.k8s_cluster_ca_certificate
  )

  load_config_file = false
}