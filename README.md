# terraform-scaleway-kapsule

[![Build Status](https://github.com/clusterfrak-dynamics/terraform-scaleway-kapsule/workflows/Terraform/badge.svg)](https://github.com/clusterfrak-dynamics/terraform-scaleway-kapsule/actions?query=workflow%3ATerraform)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/terraform-scaleway-kapsule)

A terraform module to create a managed Kubernetes cluster on Scaleway Element.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| scaleway | 2.0.0-rc.2 |

## Providers

| Name | Version |
|------|---------|
| scaleway | 2.0.0-rc.2 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [scaleway_k8s_cluster](https://registry.terraform.io/providers/scaleway/scaleway/2.0.0-rc.2/docs/resources/k8s_cluster) |
| [scaleway_k8s_pool](https://registry.terraform.io/providers/scaleway/scaleway/2.0.0-rc.2/docs/resources/k8s_pool) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admission\_plugins | The list of admission plugins to enable on the cluster. | `list` | `[]` | no |
| apiserver\_cert\_sans | Additional Subject Alternative Names for the Kubernetes API server certificate | `any` | `null` | no |
| auto\_upgrade | The auto upgrade configuration. | <pre>object({<br>    enable                        = bool<br>    maintenance_window_start_hour = number<br>    maintenance_window_day        = string<br>  })</pre> | `null` | no |
| autoscaler\_config | The configuration options for the Kubernetes cluster autoscaler. | <pre>object({<br>    enabled                          = bool<br>    disable_scale_down               = bool<br>    scale_down_delay_after_add       = string<br>    scale_down_unneeded_time         = string<br>    estimator                        = string<br>    expander                         = string<br>    ignore_daemonsets_utilization    = bool<br>    balance_similar_node_groups      = bool<br>    expendable_pods_priority_cutoff  = number<br>    scale_down_utilization_threshold = number<br>    max_graceful_termination_sec     = number<br>  })</pre> | `null` | no |
| cluster\_description | A description for the Kubernetes cluster. | `any` | n/a | yes |
| cluster\_name | The name for the Kubernetes cluster. | `any` | n/a | yes |
| cluster\_tags | The tags associated with the Kubernetes cluster. | `list` | `[]` | no |
| cni\_plugin | The Container Network Interface (CNI) for the Kubernetes cluster. | `string` | `"cilium"` | no |
| enable\_dashboard | Enables the Kubernetes dashboard for the Kubernetes cluster. | `bool` | `false` | no |
| feature\_gates | The list of feature gates to enable on the cluster. | `list` | `[]` | no |
| ingress\_controller | The ingress controller to be deployed on the Kubernetes cluster. | `string` | `"none"` | no |
| kubernetes\_version | The version of the Kubernetes cluster. | `string` | `"1.20.2"` | no |
| node\_pools | Creates and manages Scaleway Kubernetes cluster pools. | `any` | `{}` | no |
| node\_pools\_defaults | Default configuration for Kubernetes cluster pools. | `map(any)` | `{}` | no |
| open\_id\_connect\_config | The OpenID Connect configuration of the cluster | <pre>object({<br>    enabled         = bool<br>    issuer_url      = string<br>    client_id       = string<br>    username_claim  = string<br>    username_prefix = string<br>    groups_claim    = string<br>    groups_prefix   = string<br>    required_claim  = list(string)<br>  })</pre> | `null` | no |
| region | (Defaults to provider region) The region in which the cluster should be created. | `any` | `null` | no |
| tags | Tags applied to all ressources. | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| apiserver\_url | The URL of the Kubernetes API server. |
| created\_at | The creation date of the cluster. |
| id | The ID of the cluster. |
| kubeconfig | The Kubernetes configuration. |
| node\_pools | Node Pools configuration and status. |
| status | The status of the Kubernetes cluster. |
| updated\_at | The last update date of the cluster. |
| upgrade\_available | Set to `true` if a newer Kubernetes version is available. |
| wildcard\_dns | The DNS wildcard that points to all ready nodes. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
