locals {

  cluster_name        = var.cluster_name
  cluster_description = var.cluster_description
  kubernetes_version  = var.kubernetes_version
  cni_plugin          = var.cni_plugin
  enable_dashboard    = var.enable_dashboard
  ingress_controller  = var.ingress_controller
  cluster_tags        = var.cluster_tags
  tags                = var.tags

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

  feature_gates     = var.feature_gates
  admission_plugins = var.admission_plugins
  region            = var.region
  organization_id   = var.organization_id

  node_pools_defaults_defaults = {
    node_type           = "GP1-XS"
    size                = 1
    min_size            = 1
    max_size            = 3
    autohealing         = true
    autoscaling         = false
    placement_group_id  = null
    container_runtime   = "docker"
    wait_for_pool_ready = false
    tags                = []
  }

  node_pools_defaults = merge(
    local.node_pools_defaults_defaults,
    var.node_pools_defaults
  )

  node_pools = var.node_pools
}
