# terraform-scaleway-kapsule

[![Build Status](https://github.com/clusterfrak-dynamics/terraform-scaleway-kapsule/workflows/Terraform/badge.svg)](https://github.com/clusterfrak-dynamics/terraform-scaleway-kapsule/actions?query=workflow%3ATerraform)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/terraform-scaleway-kapsule)

A terraform module to create a managed Kubernetes cluster on Scaleway Element.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scaleway_k8s_cluster.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_cluster) | resource |
| [scaleway_k8s_pool.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admission_plugins"></a> [admission\_plugins](#input\_admission\_plugins) | The list of admission plugins to enable on the cluster. | `list` | `[]` | no |
| <a name="input_apiserver_cert_sans"></a> [apiserver\_cert\_sans](#input\_apiserver\_cert\_sans) | Additional Subject Alternative Names for the Kubernetes API server certificate | `any` | `null` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | The auto upgrade configuration. | <pre>object({<br>    enable                        = bool<br>    maintenance_window_start_hour = number<br>    maintenance_window_day        = string<br>  })</pre> | `null` | no |
| <a name="input_autoscaler_config"></a> [autoscaler\_config](#input\_autoscaler\_config) | The configuration options for the Kubernetes cluster autoscaler. | <pre>object({<br>    enabled                          = bool<br>    disable_scale_down               = bool<br>    scale_down_delay_after_add       = string<br>    scale_down_unneeded_time         = string<br>    estimator                        = string<br>    expander                         = string<br>    ignore_daemonsets_utilization    = bool<br>    balance_similar_node_groups      = bool<br>    expendable_pods_priority_cutoff  = number<br>    scale_down_utilization_threshold = number<br>    max_graceful_termination_sec     = number<br>  })</pre> | `null` | no |
| <a name="input_cluster_description"></a> [cluster\_description](#input\_cluster\_description) | A description for the Kubernetes cluster. | `any` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name for the Kubernetes cluster. | `any` | n/a | yes |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | The tags associated with the Kubernetes cluster. | `list` | `[]` | no |
| <a name="input_cni_plugin"></a> [cni\_plugin](#input\_cni\_plugin) | The Container Network Interface (CNI) for the Kubernetes cluster. | `string` | `"cilium"` | no |
| <a name="input_delete_additional_resources"></a> [delete\_additional\_resources](#input\_delete\_additional\_resources) | Delete additional resources like block volumes and loadbalancers that were created in Kubernetes on cluster deletion. | `bool` | `false` | no |
| <a name="input_feature_gates"></a> [feature\_gates](#input\_feature\_gates) | The list of feature gates to enable on the cluster. | `list` | `[]` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The version of the Kubernetes cluster. | `string` | `"1.20.4"` | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | Creates and manages Scaleway Kubernetes cluster pools. | `any` | `{}` | no |
| <a name="input_node_pools_defaults"></a> [node\_pools\_defaults](#input\_node\_pools\_defaults) | Default configuration for Kubernetes cluster pools. | `map(any)` | `{}` | no |
| <a name="input_open_id_connect_config"></a> [open\_id\_connect\_config](#input\_open\_id\_connect\_config) | The OpenID Connect configuration of the cluster | <pre>object({<br>    enabled         = bool<br>    issuer_url      = string<br>    client_id       = string<br>    username_claim  = string<br>    username_prefix = string<br>    groups_claim    = list(string)<br>    groups_prefix   = string<br>    required_claim  = list(string)<br>  })</pre> | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (Defaults to provider project\_id) The ID of the project the cluster is associated with. | `any` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | (Defaults to provider region) The region in which the cluster should be created. | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to all ressources. | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apiserver_url"></a> [apiserver\_url](#output\_apiserver\_url) | The URL of the Kubernetes API server. |
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The creation date of the cluster. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the cluster. |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | The Kubernetes configuration. |
| <a name="output_node_pools"></a> [node\_pools](#output\_node\_pools) | Node Pools configuration and status. |
| <a name="output_status"></a> [status](#output\_status) | The status of the Kubernetes cluster. |
| <a name="output_updated_at"></a> [updated\_at](#output\_updated\_at) | The last update date of the cluster. |
| <a name="output_upgrade_available"></a> [upgrade\_available](#output\_upgrade\_available) | Set to `true` if a newer Kubernetes version is available. |
| <a name="output_wildcard_dns"></a> [wildcard\_dns](#output\_wildcard\_dns) | The DNS wildcard that points to all ready nodes. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
