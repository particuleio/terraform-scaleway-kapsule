resource "scaleway_k8s_cluster" "this" {
  type        = var.cluster_type
  name        = var.cluster_name
  description = var.cluster_description
  version     = var.kubernetes_version
  cni         = var.cluster_type == "multicloud" ? "kilo" : var.cni_plugin
  tags        = distinct(compact(concat(var.cluster_tags, var.tags)))

  dynamic "autoscaler_config" {
    for_each = toset(var.autoscaler_config)
    content {
      disable_scale_down               = lookup(autoscaler_config.value, "disable_scale_down", null)
      scale_down_delay_after_add       = lookup(autoscaler_config.value, "scale_down_delay_after_add", null)
      scale_down_unneeded_time         = lookup(autoscaler_config.value, "scale_down_unneeded_time", null)
      estimator                        = lookup(autoscaler_config.value, "estimator", null)
      expander                         = lookup(autoscaler_config.value, "expander", null)
      ignore_daemonsets_utilization    = lookup(autoscaler_config.value, "ignore_daemonsets_utilization", null)
      balance_similar_node_groups      = lookup(autoscaler_config.value, "balance_similar_node_groups", null)
      expendable_pods_priority_cutoff  = lookup(autoscaler_config.value, "expendable_pods_priority_cutoff", null)
      scale_down_utilization_threshold = lookup(autoscaler_config.value, "scale_down_utilization_threshold", null)
      max_graceful_termination_sec     = lookup(autoscaler_config.value, "max_graceful_termination_sec", null)
    }
  }

  dynamic "auto_upgrade" {
    for_each = toset(var.auto_upgrade)
    content {
      enable                        = lookup(auto_upgrade.value, "enable", null)
      maintenance_window_start_hour = lookup(auto_upgrade.value, "maintenance_window_start_hour", null)
      maintenance_window_day        = lookup(auto_upgrade.value, "maintenance_window_day", null)
    }
  }

  feature_gates       = var.feature_gates
  admission_plugins   = var.admission_plugins
  apiserver_cert_sans = var.apiserver_cert_sans

  dynamic "open_id_connect_config" {
    for_each = toset(var.open_id_connect_config)
    content {
      issuer_url      = lookup(open_id_connect_config.value, "issuer_url", null)
      client_id       = lookup(open_id_connect_config.value, "client_id", null)
      username_claim  = lookup(open_id_connect_config.value, "username_claim", null)
      username_prefix = lookup(open_id_connect_config.value, "username_prefix", null)
      groups_claim    = lookup(open_id_connect_config.value, "groups_claim", null)
      groups_prefix   = lookup(open_id_connect_config.value, "groups_prefix", null)
      required_claim  = lookup(open_id_connect_config.value, "required_claim", null)
    }
  }

  region                      = var.region
  project_id                  = var.project_id
  delete_additional_resources = var.delete_additional_resources

}
