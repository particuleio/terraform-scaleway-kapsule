resource "scaleway_k8s_pool" "this" {
  for_each           = local.node_pools
  region             = var.region
  zone               = try(each.value.zone, null)
  cluster_id         = scaleway_k8s_cluster.this.id
  name               = "${each.key}${each.value.use_random_pet_suffix ? "-${random_pet.this[each.key].id}" : ""}"
  node_type          = try(each.value.node_type, null)
  size               = try(each.value.size, null)
  min_size           = try(each.value.min_size, null)
  max_size           = try(each.value.max_size, null)
  autoscaling        = try(each.value.autoscaling, null)
  autohealing        = try(each.value.autohealing, null)
  container_runtime  = try(each.value.container_runtime, null)
  placement_group_id = try(each.value.placement_group_id, null)
  kubelet_args       = try(each.value.kubelet_args, null)
  public_ip_disabled = try(each.value.public_ip_disabled, null)

  upgrade_policy {
    max_surge       = try(each.value.upgrade_policy.max_surge, null)
    max_unavailable = try(each.value.upgrade_policy.max_unavailable, null)
  }
  wait_for_pool_ready = try(each.value.wait_for_pool_ready, null)
  tags                = distinct(compact(concat(try(each.value.tags, null), var.tags)))

  lifecycle {
    create_before_destroy = true
  }
}

resource "random_pet" "this" {
  for_each = local.node_pools
  keepers = {
    placement_group_id = try(each.value.placement_group_id, null)
    zone               = try(each.value.zone, null)
    container_runtime  = try(each.value.container_runtime, null)
    node_type          = try(each.value.node_type, null)
  }
}
