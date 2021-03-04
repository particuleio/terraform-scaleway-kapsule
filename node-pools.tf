resource "scaleway_k8s_pool" "this" {
  for_each           = local.node_pools
  region             = local.region
  zone               = lookup(each.value, "zone", local.node_pools_defaults["zone"])
  cluster_id         = scaleway_k8s_cluster.this.id
  name               = each.key
  node_type          = lookup(each.value, "node_type", local.node_pools_defaults["node_type"])
  size               = lookup(each.value, "size", local.node_pools_defaults["size"])
  min_size           = lookup(each.value, "min_size", local.node_pools_defaults["min_size"])
  max_size           = lookup(each.value, "max_size", local.node_pools_defaults["max_size"])
  autoscaling        = lookup(each.value, "autoscaling", local.node_pools_defaults["autoscaling"])
  autohealing        = lookup(each.value, "autohealing", local.node_pools_defaults["autohealing"])
  container_runtime  = lookup(each.value, "container_runtime", local.node_pools_defaults["container_runtime"])
  placement_group_id = lookup(each.value, "placement_group_id", local.node_pools_defaults["placement_group_id"])
  kubelet_args       = lookup(each.value, "kubelet_args", local.node_pools_defaults["kubelet_args"])
  upgrade_policy {
    max_surge       = lookup(each.value["upgrade_policy"], "max_surge", local.node_pools_defaults["upgrade_policy"]["max_surge"])
    max_unavailable = lookup(each.value["upgrade_policy"], "max_unavailable", local.node_pools_defaults["upgrade_policy"]["max_unavailable"])
  }
  wait_for_pool_ready = lookup(each.value, "wait_for_pool_ready", local.node_pools_defaults["wait_for_pool_ready"])
  tags                = distinct(compact(concat(lookup(each.value, "tags", local.node_pools_defaults["tags"]), local.tags)))
}
