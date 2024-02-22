locals {

  node_pools_defaults_defaults = {
    use_random_pet_suffix = true
    node_type             = "GP1-XS"
    autohealing           = true
    autoscaling           = true
    tags                  = []
    wait_for_pool_ready   = true
    container_runtime     = "containerd"
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
