resource "scaleway_k8s_cluster" "this" {
  type        = var.cluster_type
  name        = var.cluster_name
  description = var.cluster_description
  version     = var.kubernetes_version
  cni         = var.cluster_type == "multicloud" ? "kilo" : var.cni_plugin
  tags        = distinct(compact(concat(var.cluster_tags, var.tags)))

  autoscaler_config {
    disable_scale_down               = var.autoscaler_config.disable_scale_down
    scale_down_delay_after_add       = var.autoscaler_config.scale_down_delay_after_add
    scale_down_unneeded_time         = var.autoscaler_config.scale_down_unneeded_time
    estimator                        = var.autoscaler_config.estimator
    expander                         = var.autoscaler_config.expander
    ignore_daemonsets_utilization    = var.autoscaler_config.ignore_daemonsets_utilization
    balance_similar_node_groups      = var.autoscaler_config.balance_similar_node_groups
    expendable_pods_priority_cutoff  = var.autoscaler_config.expendable_pods_priority_cutoff
    scale_down_utilization_threshold = var.autoscaler_config.scale_down_utilization_threshold
    max_graceful_termination_sec     = var.autoscaler_config.max_graceful_termination_sec
  }


  dynamic "auto_upgrade" {
    for_each = var.auto_upgrade.enable ? [1] : []
    content {
      enable                        = var.auto_upgrade.enable
      maintenance_window_start_hour = var.auto_upgrade.maintenance_window_start_hour
      maintenance_window_day        = var.auto_upgrade.maintenance_window_day
    }
  }

  private_network_id = var.private_network_id

  feature_gates       = var.feature_gates
  admission_plugins   = var.admission_plugins
  apiserver_cert_sans = var.apiserver_cert_sans

  dynamic "open_id_connect_config" {
    for_each = var.open_id_connect_config.issuer_url != null || var.open_id_connect_config.client_id != null ? [1] : []
    content {
      issuer_url      = var.open_id_connect_config.issuer_url
      client_id       = var.open_id_connect_config.client_id
      username_claim  = var.open_id_connect_config.username_claim
      username_prefix = var.open_id_connect_config.username_prefix
      groups_claim    = var.open_id_connect_config.groups_claim
      groups_prefix   = var.open_id_connect_config.groups_prefix
      required_claim  = var.open_id_connect_config.required_claim
    }
  }

  region                      = var.region
  project_id                  = var.project_id
  delete_additional_resources = var.delete_additional_resources

}
