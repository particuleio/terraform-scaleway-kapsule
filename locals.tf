locals {

  node_pools_defaults_defaults = {
    node_type           = "GP1-XS"
    size                = 1
    min_size            = 1
    max_size            = 3
    autohealing         = true
    autoscaling         = false
    placement_group_id  = null
    container_runtime   = "containerd"
    tags                = []
    wait_for_pool_ready = true
    kubelet_args        = null
    zone                = null
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
