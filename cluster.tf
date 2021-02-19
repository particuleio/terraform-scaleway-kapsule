resource "scaleway_k8s_cluster" "this" {
  name             = local.cluster_name
  description      = local.cluster_description
  version          = local.kubernetes_version
  cni              = local.cni_plugin
  enable_dashboard = local.enable_dashboard
  ingress          = local.ingress_controller
  tags             = distinct(compact(concat(local.cluster_tags, local.tags)))

  dynamic "autoscaler_config" {
    for_each = local.autoscaler_config["enabled"] ? list("autoscaler_config") : []
    content {
      disable_scale_down               = local.autoscaler_config["disable_scale_down"]
      scale_down_delay_after_add       = local.autoscaler_config["scale_down_delay_after_add"]
      scale_down_unneeded_time         = local.autoscaler_config["scale_down_unneeded_time"]
      estimator                        = local.autoscaler_config["estimator"]
      expander                         = local.autoscaler_config["expander"]
      ignore_daemonsets_utilization    = local.autoscaler_config["ignore_daemonsets_utilization"]
      balance_similar_node_groups      = local.autoscaler_config["balance_similar_node_groups"]
      expendable_pods_priority_cutoff  = local.autoscaler_config["expendable_pods_priority_cutoff"]
      scale_down_utilization_threshold = local.autoscaler_config["scale_down_utilization_threshold"]
      max_graceful_termination_sec     = local.autoscaler_config["max_graceful_termination_sec"]
    }
  }

  dynamic "auto_upgrade" {
    for_each = local.auto_upgrade["enable"] ? list("auto_upgrade") : []
    content {
      enable                        = local.auto_upgrade["enable"]
      maintenance_window_start_hour = local.auto_upgrade["maintenance_window_start_hour"]
      maintenance_window_day        = local.auto_upgrade["maintenance_window_day"]
    }
  }

  dynamic "open_id_connect_config" {
    for_each = local.open_id_connect_config["enabled"] ? list("open_id_connect_config") : []
    content {
      issuer_url      = local.open_id_connect_config["issuer_url"]
      client_id       = local.open_id_connect_config["client_id"]
      username_claim  = local.open_id_connect_config["username_claim"]
      username_prefix = local.open_id_connect_config["username_prefix"]
      groups_claim    = local.open_id_connect_config["groups_claim"]
      groups_prefix   = local.open_id_connect_config["groups_prefix"]
      required_claim  = local.open_id_connect_config["required_claim"]
    }
  }

  apiserver_cert_sans = local.apiserver_cert_sans
  feature_gates       = local.feature_gates
  admission_plugins   = local.admission_plugins
  region              = local.region
}
