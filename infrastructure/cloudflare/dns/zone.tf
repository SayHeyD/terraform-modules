data "cloudflare_accounts" "cloudflare_account" {
  name = var.account_name
}

resource "cloudflare_zone" "dns_zone" {
  account_id = data.cloudflare_accounts.cloudflare_account.id
  zone       = var.zone_name

  jump_start = var.jump_start
  paused = var.paused
  plan = var.plan
  type = var.type
}

resource "cloudflare_record" "example" {

  for_each = var.records

  zone_id = var.cloudflare_zone.dns_zone.id
  name    = each.value.name
  value   = each.value.value
  type    = each.value.type
  ttl     = each.value.ttl

  dynamic "zone_data" {
    for_each = each.value.data

  }
}
