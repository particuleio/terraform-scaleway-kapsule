module "kapsule" {
  source              = "../.."
  cluster_name        = "tkap"
  cluster_description = "tkap"

  node_pools      = {
    tkap          = {
      size        = 2
      max_size    = 3
      min_size    = 1
      autoscaling = true
    }
  }
}
