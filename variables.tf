variable "cluster_name" {
  description = "The name for the Kubernetes cluster."
}

variable "cluster_description" {
  description = "A description for the Kubernetes cluster."
}

variable "kubernetes_version" {
  default     = "1.19.1"
  description = "The version of the Kubernetes cluster."
}

variable "cni_plugin" {
  default     = "cilium"
  description = "The Container Network Interface (CNI) for the Kubernetes cluster."

  validation {
    condition     = contains(["cilium", "weave", "calico", "flannel"], var.cni_plugin)
    error_message = "Values can only be \"cilium\", \"weave\", \"calico\" or \"flannel\"."
  }
}

variable "enable_dashboard" {
  default     = false
  description = "Enables the Kubernetes dashboard for the Kubernetes cluster."
}

variable "ingress_controller" {
  default     = "none"
  description = "The ingress controller to be deployed on the Kubernetes cluster."

  validation {
    condition     = contains(["nginx", "traefik", "traefik2", "none"], var.ingress_controller)
    error_message = "Values can only be \"nginx\", \"treafik\" or \"traefik2\"."
  }
}

variable "cluster_tags" {
  default     = []
  description = "The tags associated with the Kubernetes cluster."
}

variable "autoscaler_config" {
  default = null
  type = object({
    enabled                         = bool
    disable_scale_down              = bool
    scale_down_delay_after_add      = string
    scale_down_unneeded_time        = string
    estimator                       = string
    expander                        = string
    ignore_daemonsets_utilization   = bool
    balance_similar_node_groups     = bool
    expendable_pods_priority_cutoff = number
  })
  description = "The configuration options for the Kubernetes cluster autoscaler."
}

variable "auto_upgrade" {
  default = null
  type = object({
    enable                        = bool
    maintenance_window_start_hour = number
    maintenance_window_day        = string
  })
  description = "The auto upgrade configuration."
}

variable "feature_gates" {
  default     = []
  description = "The list of feature gates to enable on the cluster."
}

variable "admission_plugins" {
  default     = []
  description = "The list of admission plugins to enable on the cluster."
}

variable "region" {
  default     = null
  description = "(Defaults to provider region) The region in which the cluster should be created."
}

variable "organization_id" {
  default     = null
  description = "(Defaults to provider organization_id) The ID of the organization the cluster is associated with."
}

variable "node_pools" {
  default     = {}
  description = "Creates and manages Scaleway Kubernetes cluster pools."
  type        = any
}

variable "node_pools_defaults" {
  default     = {}
  description = "Default configuration for Kubernetes cluster pools."
  type        = map(any)
}

variable "tags" {
  default     = []
  description = "Tags applied to all ressources."
}
