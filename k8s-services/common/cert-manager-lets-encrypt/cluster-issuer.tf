resource "kubectl_manifest" "lets_encrypt" {
  depends_on = [
    time_sleep.wait_for_api_registration
  ]

  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
  namespace: ${var.ingress_class}
spec:
  acme:
    # Email address used for ACME registration
    email: ${var.acme_registration_email}
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      # Name of a secret used to store the ACME account private key
      name: letsencrypt-prod-private-key
    # Add a single challenge solver, HTTP01 using nginx
    solvers:
    - http01:
        ingress:
          class: ${var.ingress_class}
  YAML
}