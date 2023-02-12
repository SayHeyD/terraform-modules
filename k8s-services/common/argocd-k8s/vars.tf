variable "k8s_host" {
  type = string
  description = "K8s host endpoint"
  nullable = false
}

variable "k8s_token" {
  type = string
  description = "K8s auth token"
  nullable = false
}

variable "k8s_cluster_ca_certificate" {
  type = string
  description = "K8s cluster CA cert"
  nullable = false
}

variable "namespace" {
  type = string
  description = "The namespace where argocd will be deployed"
  default = "argocd"
}

variable "create_namespace" {
  type = bool
  description = "Should the namespace be created by helm"
  default = true
}

variable "argocd_values" {
  type = list(string)
  description = "The values file for argocd"
  default = []
}

variable "app_project_name" {
  type = string
  description = "The name of the applicaiton project"
  nullable = false
}

variable "app_project_namespace" {
  type = string
  description = "The namespace where the app project will be deployed"
  default = "argocd"
}

variable "application_name" {
  type = string
  description = "ArgoCD application name"
  nullable = false
}

variable "application_namespace" {
  type = string
  description = "Namespace where the argocd applicaiton will be deployed"
  nullable = false
}

variable "application_project" {
  type = string
  description = "The project name of the first app project created"
  default = "default"
}

variable "https_repo_url" {
  type = string
  description = "The url of the git repo containing the applciations"
  nullable = false
}

variable "target_revision" {
  type = string
  description = "The branch name to source apps from"
  nullable = false
}

variable "applicaiton_path" {
  type = string
  description = "The path of the applications"
  nullable = false
}

variable "application_destination_server" {
  type = string
  description = "The destination cluster where to deploy the application"
  default = "https://kubernetes.default.svc"
}

variable "application_destination_namespace" {
  type = string
  description = "The namespace where the applicaitons from the repo will be deployed"
  default = "value"
}