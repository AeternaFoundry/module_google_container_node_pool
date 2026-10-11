output "container_node_pools_id" {
  description = "Map of id values across all container_node_pools, keyed the same as var.container_node_pools except keys with no id are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.id if v.id != null && length(v.id) > 0 }
}
output "container_node_pools_autoscaling" {
  description = "Map of autoscaling values across all container_node_pools, keyed the same as var.container_node_pools except keys with no autoscaling are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => one(v.autoscaling) if v.autoscaling != null && length(v.autoscaling) > 0 }
}
output "container_node_pools_cluster" {
  description = "Map of cluster values across all container_node_pools, keyed the same as var.container_node_pools except keys with no cluster are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.cluster if v.cluster != null && length(v.cluster) > 0 }
}
output "container_node_pools_deletion_policy" {
  description = "Map of deletion_policy values across all container_node_pools, keyed the same as var.container_node_pools except keys with no deletion_policy are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "container_node_pools_ignore_node_count_changes" {
  description = "Map of ignore_node_count_changes values across all container_node_pools, keyed the same as var.container_node_pools except keys with no ignore_node_count_changes are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.ignore_node_count_changes if v.ignore_node_count_changes != null }
}
output "container_node_pools_initial_node_count" {
  description = "Map of initial_node_count values across all container_node_pools, keyed the same as var.container_node_pools except keys with no initial_node_count are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.initial_node_count if v.initial_node_count != null }
}
output "container_node_pools_instance_group_urls" {
  description = "Map of instance_group_urls values across all container_node_pools, keyed the same as var.container_node_pools except keys with no instance_group_urls are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.instance_group_urls if v.instance_group_urls != null && length(v.instance_group_urls) > 0 }
}
output "container_node_pools_location" {
  description = "Map of location values across all container_node_pools, keyed the same as var.container_node_pools except keys with no location are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.location if v.location != null && length(v.location) > 0 }
}
output "container_node_pools_maintenance_policy" {
  description = "Map of maintenance_policy values across all container_node_pools, keyed the same as var.container_node_pools except keys with no maintenance_policy are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.maintenance_policy if v.maintenance_policy != null && length(v.maintenance_policy) > 0 }
}
output "container_node_pools_managed_instance_group_urls" {
  description = "Map of managed_instance_group_urls values across all container_node_pools, keyed the same as var.container_node_pools except keys with no managed_instance_group_urls are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.managed_instance_group_urls if v.managed_instance_group_urls != null && length(v.managed_instance_group_urls) > 0 }
}
output "container_node_pools_management" {
  description = "Map of management values across all container_node_pools, keyed the same as var.container_node_pools except keys with no management are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => one(v.management) if v.management != null && length(v.management) > 0 }
}
output "container_node_pools_max_pods_per_node" {
  description = "Map of max_pods_per_node values across all container_node_pools, keyed the same as var.container_node_pools except keys with no max_pods_per_node are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.max_pods_per_node if v.max_pods_per_node != null }
}
output "container_node_pools_name" {
  description = "Map of name values across all container_node_pools, keyed the same as var.container_node_pools except keys with no name are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.name if v.name != null && length(v.name) > 0 }
}
output "container_node_pools_name_prefix" {
  description = "Map of name_prefix values across all container_node_pools, keyed the same as var.container_node_pools except keys with no name_prefix are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.name_prefix if v.name_prefix != null && length(v.name_prefix) > 0 }
}
output "container_node_pools_network_config" {
  description = "Map of network_config values across all container_node_pools, keyed the same as var.container_node_pools except keys with no network_config are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => one(v.network_config) if v.network_config != null && length(v.network_config) > 0 }
}
output "container_node_pools_node_config" {
  description = "Map of node_config values across all container_node_pools, keyed the same as var.container_node_pools except keys with no node_config are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => one(v.node_config) if v.node_config != null && length(v.node_config) > 0 }
}
output "container_node_pools_node_count" {
  description = "Map of node_count values across all container_node_pools, keyed the same as var.container_node_pools except keys with no node_count are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.node_count if v.node_count != null }
}
output "container_node_pools_node_drain_config" {
  description = "Map of node_drain_config values across all container_node_pools, keyed the same as var.container_node_pools except keys with no node_drain_config are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.node_drain_config if v.node_drain_config != null && length(v.node_drain_config) > 0 }
}
output "container_node_pools_node_locations" {
  description = "Map of node_locations values across all container_node_pools, keyed the same as var.container_node_pools except keys with no node_locations are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.node_locations if v.node_locations != null && length(v.node_locations) > 0 }
}
output "container_node_pools_operation" {
  description = "Map of operation values across all container_node_pools, keyed the same as var.container_node_pools except keys with no operation are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.operation if v.operation != null && length(v.operation) > 0 }
}
output "container_node_pools_placement_policy" {
  description = "Map of placement_policy values across all container_node_pools, keyed the same as var.container_node_pools except keys with no placement_policy are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => one(v.placement_policy) if v.placement_policy != null && length(v.placement_policy) > 0 }
}
output "container_node_pools_project" {
  description = "Map of project values across all container_node_pools, keyed the same as var.container_node_pools except keys with no project are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.project if v.project != null && length(v.project) > 0 }
}
output "container_node_pools_queued_provisioning" {
  description = "Map of queued_provisioning values across all container_node_pools, keyed the same as var.container_node_pools except keys with no queued_provisioning are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => one(v.queued_provisioning) if v.queued_provisioning != null && length(v.queued_provisioning) > 0 }
}
output "container_node_pools_upgrade_settings" {
  description = "Map of upgrade_settings values across all container_node_pools, keyed the same as var.container_node_pools except keys with no upgrade_settings are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => one(v.upgrade_settings) if v.upgrade_settings != null && length(v.upgrade_settings) > 0 }
}
output "container_node_pools_version" {
  description = "Map of version values across all container_node_pools, keyed the same as var.container_node_pools except keys with no version are omitted"
  value       = { for k, v in google_container_node_pool.container_node_pools : k => v.version if v.version != null && length(v.version) > 0 }
}

