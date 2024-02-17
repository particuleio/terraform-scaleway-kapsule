# terraform-scaleway-kapsule

[![Build Status](https://github.com/clusterfrak-dynamics/terraform-scaleway-kapsule/workflows/Terraform/badge.svg)](https://github.com/clusterfrak-dynamics/terraform-scaleway-kapsule/actions?query=workflow%3ATerraform)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/terraform-scaleway-kapsule)

A terraform module to create a managed Kubernetes cluster on Scaleway Element.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | ~> 2.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.4 |
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | ~> 2.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [scaleway_k8s_cluster.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_cluster) | resource |
| [scaleway_k8s_pool.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admission_plugins"></a> [admission\_plugins](#input\_admission\_plugins) | The list of admission plugins to enable on the cluster | `list(string)` | `[]` | no |
| <a name="input_apiserver_cert_sans"></a> [apiserver\_cert\_sans](#input\_apiserver\_cert\_sans) | Additional Subject Alternative Names for the Kubernetes API server certificate | `list(string)` | `[]` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | The auto upgrade configuration | <pre>object({<br>    enable                        = optional(bool, false)<br>    maintenance_window_start_hour = optional(number)<br>    maintenance_window_day        = optional(number)<br>  })</pre> | `{}` | no |
| <a name="input_autoscaler_config"></a> [autoscaler\_config](#input\_autoscaler\_config) | The configuration options for the Kubernetes cluster autoscaler | <pre>object({<br>    disable_scale_down               = optional(bool)<br>    scale_down_delay_after_add       = optional(string)<br>    scale_down_unneeded_time         = optional(string)<br>    estimator                        = optional(string)<br>    expander                         = optional(string)<br>    ignore_daemonsets_utilization    = optional(bool)<br>    balance_similar_node_groups      = optional(bool)<br>    expendable_pods_priority_cutoff  = optional(number)<br>    scale_down_utilization_threshold = optional(number)<br>    max_graceful_termination_sec     = optional(number)<br>  })</pre> | `{}` | no |
| <a name="input_cluster_description"></a> [cluster\_description](#input\_cluster\_description) | A description for the Kubernetes cluster | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name for the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | The tags associated with the Kubernetes cluster | `list(any)` | `[]` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | The type of cluster | `string` | `"kapsule"` | no |
| <a name="input_cni_plugin"></a> [cni\_plugin](#input\_cni\_plugin) | The Container Network Interface (CNI) for the Kubernetes cluster | `string` | `"cilium"` | no |
| <a name="input_delete_additional_resources"></a> [delete\_additional\_resources](#input\_delete\_additional\_resources) | Delete additional resources like block volumes and loadbalancers that were created in Kubernetes on cluster deletion | `bool` | `false` | no |
| <a name="input_feature_gates"></a> [feature\_gates](#input\_feature\_gates) | The list of feature gates to enable on the cluster | `list(string)` | `[]` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The version of the Kubernetes cluster | `string` | `"1.24.5"` | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | Creates and manages Scaleway Kubernetes cluster pools | `any` | `{}` | no |
| <a name="input_node_pools_defaults"></a> [node\_pools\_defaults](#input\_node\_pools\_defaults) | Default configuration for Kubernetes cluster pools | `map(any)` | `{}` | no |
| <a name="input_open_id_connect_config"></a> [open\_id\_connect\_config](#input\_open\_id\_connect\_config) | The OpenID Connect configuration of the cluster | <pre>object({<br>    issuer_url      = optional(string)<br>    client_id       = optional(string)<br>    username_claim  = optional(string)<br>    username_prefix = optional(string)<br>    groups_claim    = optional(list(string))<br>    groups_prefix   = optional(string)<br>    required_claim  = optional(list(string))<br>  })</pre> | `{}` | no |
| <a name="input_private_network_id"></a> [private\_network\_id](#input\_private\_network\_id) | The ID of the private network the cluster is associated with | `string` | `null` | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (Defaults to provider project\_id) The ID of the project the cluster is associated with | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | (Defaults to provider region) The region in which the cluster should be created | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to all ressources. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apiserver_url"></a> [apiserver\_url](#output\_apiserver\_url) | The URL of the Kubernetes API server. |
| <a name="output_cluster_ca_cert"></a> [cluster\_ca\_cert](#output\_cluster\_ca\_cert) | PEM based cluster ca certificate. |
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | The creation date of the cluster. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the cluster. |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | The Kubernetes configuration. |
| <a name="output_kubeconfig_file"></a> [kubeconfig\_file](#output\_kubeconfig\_file) | The Kubernetes configuration file. |
| <a name="output_name"></a> [name](#output\_name) | The name of the cluster. |
| <a name="output_node_pools"></a> [node\_pools](#output\_node\_pools) | Node Pools configuration and status. |
| <a name="output_status"></a> [status](#output\_status) | The status of the Kubernetes cluster. |
| <a name="output_token"></a> [token](#output\_token) | Token for authenticating to API-Server. |
| <a name="output_updated_at"></a> [updated\_at](#output\_updated\_at) | The last update date of the cluster. |
| <a name="output_upgrade_available"></a> [upgrade\_available](#output\_upgrade\_available) | Set to `true` if a newer Kubernetes version is available. |
| <a name="output_wildcard_dns"></a> [wildcard\_dns](#output\_wildcard\_dns) | The DNS wildcard that points to all ready nodes. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
