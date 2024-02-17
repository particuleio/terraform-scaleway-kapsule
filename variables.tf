variable "cluster_name" {
  type        = string
  description = "The name for the Kubernetes cluster"
}

variable "cluster_type" {
  description = "The type of cluster"
  type        = string
  default     = "kapsule"
}

variable "cluster_description" {
  type        = string
  description = "A description for the Kubernetes cluster"
  default     = null
}

variable "kubernetes_version" {
  default     = "1.24.5"
  type        = string
  description = "The version of the Kubernetes cluster"
}

variable "project_id" {
  default     = null
  type        = string
  description = "(Defaults to provider project_id) The ID of the project the cluster is associated with"
}

variable "cni_plugin" {
  default     = "cilium"
  type        = string
  description = "The Container Network Interface (CNI) for the Kubernetes cluster"

  validation {
    condition     = contains(["cilium", "weave", "calico", "flannel", "kilo"], var.cni_plugin)
    error_message = "Values can only be \"cilium\", \"weave\", \"calico\", \"flannel\" or \"kilo\"."
  }
}

variable "cluster_tags" {
  type        = list(any)
  default     = []
  description = "The tags associated with the Kubernetes cluster"
}

variable "autoscaler_config" {
  default = {}
  type = object({
    disable_scale_down               = optional(bool)
    scale_down_delay_after_add       = optional(string)
    scale_down_unneeded_time         = optional(string)
    estimator                        = optional(string)
    expander                         = optional(string)
    ignore_daemonsets_utilization    = optional(bool)
    balance_similar_node_groups      = optional(bool)
    expendable_pods_priority_cutoff  = optional(number)
    scale_down_utilization_threshold = optional(number)
    max_graceful_termination_sec     = optional(number)
  })
  description = "The configuration options for the Kubernetes cluster autoscaler"
}

variable "auto_upgrade" {
  default = {}
  type = object({
    enable                        = optional(bool, false)
    maintenance_window_start_hour = optional(number)
    maintenance_window_day        = optional(string)
  })
  description = "The auto upgrade configuration"
}

variable "open_id_connect_config" {
  default = {}
  type = object({
    issuer_url      = optional(string)
    client_id       = optional(string)
    username_claim  = optional(string)
    username_prefix = optional(string)
    groups_claim    = optional(list(string))
    groups_prefix   = optional(string)
    required_claim  = optional(list(string))
  })
  description = "The OpenID Connect configuration of the cluster"
}

variable "feature_gates" {
  type        = list(string)
  default     = []
  description = "The list of feature gates to enable on the cluster"
}

variable "admission_plugins" {
  type        = list(string)
  default     = []
  description = "The list of admission plugins to enable on the cluster"
}

variable "apiserver_cert_sans" {
  default     = []
  type        = list(string)
  description = "Additional Subject Alternative Names for the Kubernetes API server certificate"
}

variable "region" {
  default     = null
  type        = string
  description = "(Defaults to provider region) The region in which the cluster should be created"
}

variable "node_pools" {
  default     = {}
  description = "Creates and manages Scaleway Kubernetes cluster pools"
  type        = any
}

variable "node_pools_defaults" {
  default     = {}
  description = "Default configuration for Kubernetes cluster pools"
  type        = map(any)
}

variable "tags" {
  type        = list(string)
  default     = []
  description = "Tags applied to all ressources."
}

variable "delete_additional_resources" {
  type        = bool
  default     = false
  description = "Delete additional resources like block volumes and loadbalancers that were created in Kubernetes on cluster deletion"
}
