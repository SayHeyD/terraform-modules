variable "cloudflare_api_token" {
  type = string
  description = "The API token for accessing the cloudflare DNS zone"
  nullable = false
}

variable "account_name" {
  type = string
  description = "The cloudflare account that contains the DNS zone"
  nullable = false
}

variable "zone_name" {
  type = string
  description = "The domain name to create a zone for"
  nullable = false
}

variable "jump_start" {
  type = bool
  description = "If cloudflare should scan for existing DNS records (ignored after creation)"
  default = false
}

variable "paused" {
  type = bool
  description = "Whether this zone is paused (traffic bypasses Cloudflare)"
  default = false
}

variable "plan" {
  type = string
  description = "The name of the commercial plan to apply to the zone"
  default = "free"
}

variable "type" {
  type = string
  description = "A full zone implies that DNS is hosted with Cloudflare. A partial zone is typically a partner-hosted zone or a CNAME setup"
  default = "full"
}

variable "records" {
  type = list(object({
    zone_id = string
    name    = string
    value   = string
    type    = string
    ttl     = number
    
    # Refer to https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record#nested-schema-for-data
    data    = any

    # Refer to https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record#nested-schema-for-timeouts
    timeouts = any
  }))
  description = "A list of records to apply to the DNS zone"
  default = []
}