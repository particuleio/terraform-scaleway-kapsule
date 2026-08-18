resource "scaleway_instance_security_group" "this" {
  for_each = { for k, v in local.node_pools : k => v if length(try(v.security_group_rules, [])) > 0 }

  name                    = "${each.key}-security-group"
  description             = "Security group for the ${each.key} node pool"
  zone                    = try(each.value.zone, null)
  project_id              = var.project_id
  stateful                = try(each.value.security_group_stateful, true)
  inbound_default_policy  = try(each.value.security_group_inbound_default_policy, "drop")
  outbound_default_policy = try(each.value.security_group_outbound_default_policy, "accept")
  tags                    = distinct(compact(concat(try(each.value.tags, null), var.tags)))
  enable_default_security = try(each.value.enable_default_security, true)

  dynamic "inbound_rule" {
    for_each = [for rule in each.value.security_group_rules : rule if try(rule.direction, "inbound") == "inbound"]
    content {
      action     = inbound_rule.value.action
      protocol   = try(inbound_rule.value.protocol, "TCP")
      port       = try(inbound_rule.value.port, null)
      port_range = try(inbound_rule.value.port_range, null)
      ip_range   = try(inbound_rule.value.ip_range, "0.0.0.0/0")
    }
  }

  dynamic "outbound_rule" {
    for_each = [for rule in each.value.security_group_rules : rule if try(rule.direction, "inbound") == "outbound"]
    content {
      action     = outbound_rule.value.action
      protocol   = try(outbound_rule.value.protocol, "TCP")
      port       = try(outbound_rule.value.port, null)
      port_range = try(outbound_rule.value.port_range, null)
      ip_range   = try(outbound_rule.value.ip_range, "0.0.0.0/0")
    }
  }
}
