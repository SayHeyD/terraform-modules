variable "do_token" {
  type = string
  description = "APi token for digitalocean"
  nullable = false
}

variable "cluster_name" {
  type = string
  description = "The name of the k8s-cluster"
  nullable = false
}

variable "region" {
  type = string
  description = "The digitalocean region where the cluster is deployed"
  nullable = false
}

variable "cluster_version" {
  type = string
  description = "Digitalocean k8s cluster version"
  # Grab the latest version slug from `doctl kubernetes options versions`
  default = "1.25.4-do.0"
}

variable "high_availability" {
  type = bool
  description = "Control plane high availability (40$/month)"
  # Grab the latest version slug from `doctl kubernetes options versions`
  default = false
}

variable "maintenance_policy" {
  type = object({
    day = string,
    start_time = string
  })
  description = "The maintenance policy for the k8s cluster control plane"
  nullable = false
}

variable "node_pools" {
  type = list(object({
    name = string,
    size = string,
    node_count = number,
    auto_scale = bool,
    min_nodes = number,
    max_nodes = number,
    tags = list(string),
    labels = map(string),
    taint = object({
      key = string,
      value = string,
      effect = string # 
    })
  }))
  description = "The node pool configuration for the k8s cluster"
  nullable = false
}

variable "argocd_helm_values_files" {
  type = list(string)
  description = "Values files for the argocd helm chart"
  nullable = false
}

variable "acme_registration_email" {
  type = string
  description = "Email for acme registration"
  nullable = false
}

variable "ingress_controller_namespace" {
  type = string
  description = "The namespace name of the ingress controller"
  default = "nginx-ingress-controller"
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

variable "sops_namespace" {
  type = string
  description = "The namespace were the the sops resources will be deployed"
  default = "sops"
}

variable "sops_crd_namespace" {
  type = string
  description = "The namespace were the the sops CRDs will be deployed"
  default = "sops"
}

variable "sops_age_key" {
  type = string
  description = "The age key secret for the sops-operator"
  nullable = false
}