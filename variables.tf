variable "container_node_pools" {
  description = <<EOT
Map of container_node_pools, attributes below
Required:
    - cluster
Optional:
    - deletion_policy
    - ignore_node_count_changes
    - initial_node_count
    - location
    - max_pods_per_node
    - name
    - name_prefix
    - node_count
    - node_locations
    - project
    - version
    - autoscaling (block):
        - location_policy (optional)
        - max_node_count (optional)
        - min_node_count (optional)
        - total_max_node_count (optional)
        - total_min_node_count (optional)
    - maintenance_policy (block):
        - exclusion_until_end_of_support (optional, block):
            - enabled (optional)
    - management (block):
        - auto_repair (optional)
        - auto_upgrade (optional)
    - network_config (block):
        - accelerator_network_profile (optional)
        - additional_node_network_configs (optional, block):
            - network (optional)
            - subnetwork (optional)
        - additional_pod_network_configs (optional, block):
            - max_pods_per_node (optional)
            - secondary_pod_range (optional)
            - subnetwork (optional)
        - create_pod_range (optional)
        - enable_private_nodes (optional)
        - network_performance_config (optional, block):
            - total_egress_bandwidth_tier (required)
        - pod_cidr_overprovision_config (optional, block):
            - disabled (required)
        - pod_ipv4_cidr_block (optional)
        - pod_range (optional)
        - subnetwork (optional)
    - node_config (block):
        - advanced_machine_features (optional, block):
            - enable_nested_virtualization (optional)
            - performance_monitoring_unit (optional)
            - threads_per_core (required)
        - boot_disk (optional, block):
            - disk_type (optional)
            - provisioned_iops (optional)
            - provisioned_throughput (optional)
            - size_gb (optional)
        - boot_disk_kms_key (optional)
        - confidential_nodes (optional, block):
            - confidential_instance_type (optional)
            - enabled (required)
        - containerd_config (optional, block):
            - private_registry_access_config (optional, block):
                - certificate_authority_domain_config (optional, block):
                    - fqdns (required)
                    - gcp_secret_manager_certificate_config (required, block):
                        - secret_uri (required)
                - enabled (required)
            - registry_hosts (optional, block):
                - hosts (optional, block):
                    - ca (optional, block):
                        - gcp_secret_manager_secret_uri (optional)
                    - capabilities (optional)
                    - client (optional, block):
                        - cert (required, block):
                            - gcp_secret_manager_secret_uri (optional)
                        - key (optional, block):
                            - gcp_secret_manager_secret_uri (optional)
                    - dial_timeout (optional)
                    - header (optional, block):
                        - key (required)
                        - value (required)
                    - host (required)
                    - override_path (optional)
                - server (required)
            - writable_cgroups (optional, block):
                - enabled (required)
        - disk_size_gb (optional)
        - disk_type (optional)
        - enable_confidential_storage (optional)
        - ephemeral_storage_local_ssd_config (optional, block):
            - data_cache_count (optional)
            - local_ssd_count (required)
        - fast_socket (optional, block):
            - enabled (required)
        - flex_start (optional)
        - gcfs_config (optional, block):
            - enabled (required)
        - gpudirect_strategy (optional)
        - guest_accelerator (optional, block):
            - count (required)
            - gpu_driver_installation_config (optional, block):
                - gpu_driver_version (required)
            - gpu_partition_size (optional)
            - gpu_sharing_config (optional, block):
                - gpu_sharing_strategy (required)
                - max_shared_clients_per_gpu (required)
            - type (required)
        - gvnic (optional, block):
            - enabled (required)
        - image_type (optional)
        - kubelet_config (optional, block):
            - allowed_unsafe_sysctls (optional)
            - container_log_max_files (optional)
            - container_log_max_size (optional)
            - cpu_cfs_quota (optional)
            - cpu_cfs_quota_period (optional)
            - cpu_manager_policy (optional)
            - crash_loop_back_off (optional, block):
                - max_container_restart_period (optional)
            - eviction_max_pod_grace_period_seconds (optional)
            - eviction_minimum_reclaim (optional, block):
                - imagefs_available (optional)
                - imagefs_inodes_free (optional)
                - memory_available (optional)
                - nodefs_available (optional)
                - nodefs_inodes_free (optional)
                - pid_available (optional)
            - eviction_soft (optional, block):
                - imagefs_available (optional)
                - imagefs_inodes_free (optional)
                - memory_available (optional)
                - nodefs_available (optional)
                - nodefs_inodes_free (optional)
                - pid_available (optional)
            - eviction_soft_grace_period (optional, block):
                - imagefs_available (optional)
                - imagefs_inodes_free (optional)
                - memory_available (optional)
                - nodefs_available (optional)
                - nodefs_inodes_free (optional)
                - pid_available (optional)
            - image_gc_high_threshold_percent (optional)
            - image_gc_low_threshold_percent (optional)
            - image_maximum_gc_age (optional)
            - image_minimum_gc_age (optional)
            - insecure_kubelet_readonly_port_enabled (optional)
            - max_parallel_image_pulls (optional)
            - memory_manager (optional, block):
                - policy (optional)
            - pod_pids_limit (optional)
            - shutdown_grace_period_critical_pods_seconds (optional)
            - shutdown_grace_period_seconds (optional)
            - single_process_oom_kill (optional)
            - topology_manager (optional, block):
                - policy (optional)
                - scope (optional)
        - labels (optional)
        - linux_node_config (optional, block):
            - accurate_time_config (optional, block):
                - enable_ptp_kvm_time_sync (optional)
            - cgroup_mode (optional)
            - custom_node_init (optional, block):
                - init_script (optional, block):
                    - gcp_secret_manager_secret_uri (optional)
                    - gcs_generation (optional)
                    - gcs_uri (optional)
            - hugepages_config (optional, block):
                - hugepage_size_1g (optional)
                - hugepage_size_2m (optional)
            - node_kernel_module_loading (optional, block):
                - policy (optional)
            - swap_config (optional, block):
                - boot_disk_profile (optional, block):
                    - swap_size_gib (optional)
                    - swap_size_percent (optional)
                - dedicated_local_ssd_profile (optional, block):
                    - disk_count (optional)
                - enabled (optional)
                - encryption_config (optional, block):
                    - disabled (optional)
                - ephemeral_local_ssd_profile (optional, block):
                    - swap_size_gib (optional)
                    - swap_size_percent (optional)
            - sysctls (optional)
            - transparent_hugepage_defrag (optional)
            - transparent_hugepage_enabled (optional)
        - local_nvme_ssd_block_config (optional, block):
            - local_ssd_count (required)
        - local_ssd_count (optional)
        - local_ssd_encryption_mode (optional)
        - logging_variant (optional)
        - machine_type (optional)
        - max_run_duration (optional)
        - metadata (optional)
        - min_cpu_platform (optional)
        - node_group (optional)
        - node_image_config (optional, block):
            - image (optional)
            - image_project (optional)
        - oauth_scopes (optional)
        - preemptible (optional)
        - reservation_affinity (optional, block):
            - consume_reservation_type (required)
            - key (optional)
            - values (optional)
        - resource_labels (optional)
        - resource_manager_tags (optional)
        - sandbox_config (optional, block):
            - type (required)
        - secondary_boot_disks (optional, block):
            - disk_image (required)
            - mode (optional)
        - service_account (optional)
        - shielded_instance_config (optional, block):
            - enable_integrity_monitoring (optional)
            - enable_secure_boot (optional)
        - sole_tenant_config (optional, block):
            - min_node_cpus (optional)
            - node_affinity (required, block):
                - key (required)
                - operator (required)
                - values (required)
        - spot (optional)
        - storage_pools (optional)
        - tags (optional)
        - taint (optional, block):
            - effect (required)
            - key (required)
            - value (required)
        - taint_config (optional, block):
            - architecture_taint_behavior (required)
        - windows_node_config (optional, block):
            - osversion (optional)
        - workload_metadata_config (optional, block):
            - mode (required)
    - node_drain_config (block):
        - grace_termination_duration (optional)
        - pdb_timeout_duration (optional)
        - respect_pdb_during_node_pool_deletion (optional)
    - placement_policy (block):
        - policy_name (optional)
        - tpu_topology (optional)
        - type (required)
    - queued_provisioning (block):
        - enabled (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - upgrade_settings (block):
        - blue_green_settings (optional, block):
            - node_pool_soak_duration (optional)
            - standard_rollout_policy (required, block):
                - batch_node_count (optional)
                - batch_percentage (optional)
                - batch_soak_duration (optional)
        - max_surge (optional)
        - max_unavailable (optional)
        - strategy (optional)
EOT

  type = map(object({
    cluster                   = string
    deletion_policy           = optional(string)
    ignore_node_count_changes = optional(bool)
    initial_node_count        = optional(number)
    location                  = optional(string)
    max_pods_per_node         = optional(number)
    name                      = optional(string)
    name_prefix               = optional(string)
    node_count                = optional(number)
    node_locations            = optional(set(string))
    project                   = optional(string)
    version                   = optional(string)
    autoscaling = optional(object({
      location_policy      = optional(string)
      max_node_count       = optional(number)
      min_node_count       = optional(number)
      total_max_node_count = optional(number)
      total_min_node_count = optional(number)
    }))
    maintenance_policy = optional(list(object({
      exclusion_until_end_of_support = optional(list(object({
        enabled = optional(bool)
      })))
    })))
    management = optional(object({
      auto_repair  = optional(bool)
      auto_upgrade = optional(bool)
    }))
    network_config = optional(object({
      accelerator_network_profile = optional(string)
      additional_node_network_configs = optional(list(object({
        network    = optional(string)
        subnetwork = optional(string)
      })))
      additional_pod_network_configs = optional(list(object({
        max_pods_per_node   = optional(number)
        secondary_pod_range = optional(string)
        subnetwork          = optional(string)
      })))
      create_pod_range     = optional(bool)
      enable_private_nodes = optional(bool)
      network_performance_config = optional(object({
        total_egress_bandwidth_tier = string
      }))
      pod_cidr_overprovision_config = optional(object({
        disabled = bool
      }))
      pod_ipv4_cidr_block = optional(string)
      pod_range           = optional(string)
      subnetwork          = optional(string)
    }))
    node_config = optional(object({
      advanced_machine_features = optional(object({
        enable_nested_virtualization = optional(bool)
        performance_monitoring_unit  = optional(string)
        threads_per_core             = number
      }))
      boot_disk = optional(object({
        disk_type              = optional(string)
        provisioned_iops       = optional(number)
        provisioned_throughput = optional(number)
        size_gb                = optional(number)
      }))
      boot_disk_kms_key = optional(string)
      confidential_nodes = optional(object({
        confidential_instance_type = optional(string)
        enabled                    = bool
      }))
      containerd_config = optional(object({
        private_registry_access_config = optional(object({
          certificate_authority_domain_config = optional(list(object({
            fqdns = list(string)
            gcp_secret_manager_certificate_config = object({
              secret_uri = string
            })
          })))
          enabled = bool
        }))
        registry_hosts = optional(list(object({
          hosts = optional(list(object({
            ca = optional(list(object({
              gcp_secret_manager_secret_uri = optional(string)
            })))
            capabilities = optional(list(string))
            client = optional(list(object({
              cert = object({
                gcp_secret_manager_secret_uri = optional(string)
              })
              key = optional(object({
                gcp_secret_manager_secret_uri = optional(string)
              }))
            })))
            dial_timeout = optional(string)
            header = optional(list(object({
              key   = string
              value = list(string)
            })))
            host          = string
            override_path = optional(bool)
          })))
          server = string
        })))
        writable_cgroups = optional(object({
          enabled = bool
        }))
      }))
      disk_size_gb                = optional(number)
      disk_type                   = optional(string)
      enable_confidential_storage = optional(bool)
      ephemeral_storage_local_ssd_config = optional(object({
        data_cache_count = optional(number)
        local_ssd_count  = number
      }))
      fast_socket = optional(object({
        enabled = bool
      }))
      flex_start = optional(bool)
      gcfs_config = optional(object({
        enabled = bool
      }))
      gpudirect_strategy = optional(string)
      guest_accelerator = optional(list(object({
        count = number
        gpu_driver_installation_config = optional(object({
          gpu_driver_version = string
        }))
        gpu_partition_size = optional(string)
        gpu_sharing_config = optional(object({
          gpu_sharing_strategy       = string
          max_shared_clients_per_gpu = number
        }))
        type = string
      })))
      gvnic = optional(object({
        enabled = bool
      }))
      image_type = optional(string)
      kubelet_config = optional(object({
        allowed_unsafe_sysctls  = optional(list(string))
        container_log_max_files = optional(number)
        container_log_max_size  = optional(string)
        cpu_cfs_quota           = optional(bool)
        cpu_cfs_quota_period    = optional(string)
        cpu_manager_policy      = optional(string)
        crash_loop_back_off = optional(object({
          max_container_restart_period = optional(string)
        }))
        eviction_max_pod_grace_period_seconds = optional(number)
        eviction_minimum_reclaim = optional(object({
          imagefs_available   = optional(string)
          imagefs_inodes_free = optional(string)
          memory_available    = optional(string)
          nodefs_available    = optional(string)
          nodefs_inodes_free  = optional(string)
          pid_available       = optional(string)
        }))
        eviction_soft = optional(object({
          imagefs_available   = optional(string)
          imagefs_inodes_free = optional(string)
          memory_available    = optional(string)
          nodefs_available    = optional(string)
          nodefs_inodes_free  = optional(string)
          pid_available       = optional(string)
        }))
        eviction_soft_grace_period = optional(object({
          imagefs_available   = optional(string)
          imagefs_inodes_free = optional(string)
          memory_available    = optional(string)
          nodefs_available    = optional(string)
          nodefs_inodes_free  = optional(string)
          pid_available       = optional(string)
        }))
        image_gc_high_threshold_percent        = optional(number)
        image_gc_low_threshold_percent         = optional(number)
        image_maximum_gc_age                   = optional(string)
        image_minimum_gc_age                   = optional(string)
        insecure_kubelet_readonly_port_enabled = optional(string)
        max_parallel_image_pulls               = optional(number)
        memory_manager = optional(object({
          policy = optional(string)
        }))
        pod_pids_limit                              = optional(number)
        shutdown_grace_period_critical_pods_seconds = optional(number)
        shutdown_grace_period_seconds               = optional(number)
        single_process_oom_kill                     = optional(bool)
        topology_manager = optional(object({
          policy = optional(string)
          scope  = optional(string)
        }))
      }))
      labels = optional(map(string))
      linux_node_config = optional(object({
        accurate_time_config = optional(object({
          enable_ptp_kvm_time_sync = optional(bool)
        }))
        cgroup_mode = optional(string)
        custom_node_init = optional(object({
          init_script = optional(object({
            gcp_secret_manager_secret_uri = optional(string)
            gcs_generation                = optional(number)
            gcs_uri                       = optional(string)
          }))
        }))
        hugepages_config = optional(object({
          hugepage_size_1g = optional(number)
          hugepage_size_2m = optional(number)
        }))
        node_kernel_module_loading = optional(object({
          policy = optional(string)
        }))
        swap_config = optional(object({
          boot_disk_profile = optional(object({
            swap_size_gib     = optional(number)
            swap_size_percent = optional(number)
          }))
          dedicated_local_ssd_profile = optional(object({
            disk_count = optional(number)
          }))
          enabled = optional(bool)
          encryption_config = optional(object({
            disabled = optional(bool)
          }))
          ephemeral_local_ssd_profile = optional(object({
            swap_size_gib     = optional(number)
            swap_size_percent = optional(number)
          }))
        }))
        sysctls                      = optional(map(string))
        transparent_hugepage_defrag  = optional(string)
        transparent_hugepage_enabled = optional(string)
      }))
      local_nvme_ssd_block_config = optional(object({
        local_ssd_count = number
      }))
      local_ssd_count           = optional(number)
      local_ssd_encryption_mode = optional(string)
      logging_variant           = optional(string)
      machine_type              = optional(string)
      max_run_duration          = optional(string)
      metadata                  = optional(map(string))
      min_cpu_platform          = optional(string)
      node_group                = optional(string)
      node_image_config = optional(list(object({
        image         = optional(string)
        image_project = optional(string)
      })))
      oauth_scopes = optional(set(string))
      preemptible  = optional(bool)
      reservation_affinity = optional(object({
        consume_reservation_type = string
        key                      = optional(string)
        values                   = optional(set(string))
      }))
      resource_labels       = optional(map(string))
      resource_manager_tags = optional(map(string))
      sandbox_config = optional(object({
        type = string
      }))
      secondary_boot_disks = optional(list(object({
        disk_image = string
        mode       = optional(string)
      })))
      service_account = optional(string)
      shielded_instance_config = optional(object({
        enable_integrity_monitoring = optional(bool)
        enable_secure_boot          = optional(bool)
      }))
      sole_tenant_config = optional(object({
        min_node_cpus = optional(number)
        node_affinity = list(object({
          key      = string
          operator = string
          values   = list(string)
        }))
      }))
      spot          = optional(bool)
      storage_pools = optional(list(string))
      tags          = optional(list(string))
      taint = optional(list(object({
        effect = string
        key    = string
        value  = string
      })))
      taint_config = optional(object({
        architecture_taint_behavior = string
      }))
      windows_node_config = optional(object({
        osversion = optional(string)
      }))
      workload_metadata_config = optional(object({
        mode = string
      }))
    }))
    node_drain_config = optional(list(object({
      grace_termination_duration            = optional(string)
      pdb_timeout_duration                  = optional(string)
      respect_pdb_during_node_pool_deletion = optional(bool)
    })))
    placement_policy = optional(object({
      policy_name  = optional(string)
      tpu_topology = optional(string)
      type         = string
    }))
    queued_provisioning = optional(object({
      enabled = bool
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    upgrade_settings = optional(object({
      blue_green_settings = optional(object({
        node_pool_soak_duration = optional(string)
        standard_rollout_policy = object({
          batch_node_count    = optional(number)
          batch_percentage    = optional(number)
          batch_soak_duration = optional(string)
        })
      }))
      max_surge       = optional(number)
      max_unavailable = optional(number)
      strategy        = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.container_node_pools : (
        v.node_config == null || (v.node_config.secondary_boot_disks == null || (length(v.node_config.secondary_boot_disks) <= 127))
      )
    ])
    error_message = "Each secondary_boot_disks list must contain at most 127 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_node_pools : (
        v.node_config == null || (v.node_config.sole_tenant_config == null || (length(v.node_config.sole_tenant_config.node_affinity) >= 1))
      )
    ])
    error_message = "Each node_affinity list must contain at least 1 items"
  }
}

