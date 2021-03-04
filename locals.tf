locals {

  cluster_name                = var.cluster_name
  cluster_description         = var.cluster_description
  kubernetes_version          = var.kubernetes_version
  project_id                  = var.project_id
  cni_plugin                  = var.cni_plugin
  enable_dashboard            = var.enable_dashboard
  ingress_controller          = var.ingress_controller
  cluster_tags                = var.cluster_tags
  tags                        = var.tags
  delete_additional_resources = var.delete_additional_resources

  autoscaler_config_default = {
    enabled                         = false
    disable_scale_down              = false
    scale_down_delay_after_add      = "5m"
    scale_down_unneeded_time        = "5m"
    estimator                       = "binpacking"
    expander                        = "random"
    ignore_daemonsets_utilization   = true
    balance_similar_node_groups     = true
    expendable_pods_priority_cutoff = -5
    scale_down_utilization_treshold = 0.5
    max_graceful_termination_sec    = 600
  }

  autoscaler_config = merge(
    local.autoscaler_config_default,
    var.autoscaler_config
  )

  auto_upgrade_default = {
    enable                        = false
    maintenance_window_start_hour = 2
    maintenance_window_day        = "sunday"
  }

  auto_upgrade = merge(
    local.auto_upgrade_default,
    var.auto_upgrade
  )

  open_id_connect_config_default = {
    enabled = false
  }

  open_id_connect_config = merge(
    local.open_id_connect_config_default,
    var.open_id_connect_config
  )

  apiserver_cert_sans = var.apiserver_cert_sans
  feature_gates       = var.feature_gates
  admission_plugins   = var.admission_plugins
  region              = var.region
  zone                = var.zone

  node_pools_defaults_defaults = {
    node_type           = "GP1-XS"
    size                = 1
    min_size            = 1
    max_size            = 3
    autohealing         = true
    autoscaling         = false
    placement_group_id  = null
    container_runtime   = "docker"
    tags                = []
    wait_for_pool_ready = false
    kubelet_args        = ""
    upgrade_policy = {
      max_surge       = 0
      max_unavailable = 1
    }
  }

  node_pools_defaults = merge(
    local.node_pools_defaults_defaults,
    var.node_pools_defaults
  )

  node_pools = { for k, v in var.node_pools : k => merge(
    local.node_pools_defaults,
    v
    )
  }
}
