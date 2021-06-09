output "id" {
  value       = scaleway_k8s_cluster.this.id
  description = "The ID of the cluster."
}

output "name" {
  value       = scaleway_k8s_cluster.this.name
  description = "The name of the cluster."
}

output "created_at" {
  value       = scaleway_k8s_cluster.this.created_at
  description = "The creation date of the cluster."
}

output "updated_at" {
  value       = scaleway_k8s_cluster.this.updated_at
  description = "The last update date of the cluster."
}

output "apiserver_url" {
  value       = scaleway_k8s_cluster.this.apiserver_url
  description = "The URL of the Kubernetes API server."
}

output "wildcard_dns" {
  value       = scaleway_k8s_cluster.this.wildcard_dns
  description = "The DNS wildcard that points to all ready nodes."
}

output "kubeconfig" {
  value       = scaleway_k8s_cluster.this.kubeconfig
  description = "The Kubernetes configuration."
  sensitive   = true
}

output "kubeconfig_file" {
  value       = scaleway_k8s_cluster.this.kubeconfig.0.config_file
  description = "The Kubernetes configuration file."
  sensitive   = true
}

output "cluster_ca_cert" {
  value       = scaleway_k8s_cluster.this.kubeconfig.0.cluster_ca_certificate
  description = "PEM based cluster ca certificate."
}

output "token" {
  value       = scaleway_k8s_cluster.this.kubeconfig.0.token
  description = "Token for authenticating to API-Server."
  sensitive   = true
}

output "status" {
  value       = scaleway_k8s_cluster.this.status
  description = "The status of the Kubernetes cluster."
}

output "upgrade_available" {
  value       = scaleway_k8s_cluster.this.upgrade_available
  description = "Set to `true` if a newer Kubernetes version is available."
}

output "node_pools" {
  value = {
    for node_pool in scaleway_k8s_pool.this :
    node_pool.name => node_pool.*
  }
  description = "Node Pools configuration and status."
}
