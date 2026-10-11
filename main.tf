resource "google_container_node_pool" "container_node_pools" {
  for_each = var.container_node_pools

  cluster                   = each.value.cluster
  deletion_policy           = each.value.deletion_policy
  ignore_node_count_changes = each.value.ignore_node_count_changes
  initial_node_count        = each.value.initial_node_count
  location                  = each.value.location
  max_pods_per_node         = each.value.max_pods_per_node
  name                      = each.value.name
  name_prefix               = each.value.name_prefix
  node_count                = each.value.node_count
  node_locations            = each.value.node_locations
  project                   = each.value.project
  version                   = each.value.version

  dynamic "autoscaling" {
    for_each = each.value.autoscaling != null ? [each.value.autoscaling] : []
    content {
      location_policy      = autoscaling.value.location_policy
      max_node_count       = autoscaling.value.max_node_count
      min_node_count       = autoscaling.value.min_node_count
      total_max_node_count = autoscaling.value.total_max_node_count
      total_min_node_count = autoscaling.value.total_min_node_count
    }
  }

  dynamic "maintenance_policy" {
    for_each = each.value.maintenance_policy != null ? each.value.maintenance_policy : []
    content {
      dynamic "exclusion_until_end_of_support" {
        for_each = maintenance_policy.value.exclusion_until_end_of_support != null ? maintenance_policy.value.exclusion_until_end_of_support : []
        content {
          enabled = exclusion_until_end_of_support.value.enabled
        }
      }
    }
  }

  dynamic "management" {
    for_each = each.value.management != null ? [each.value.management] : []
    content {
      auto_repair  = management.value.auto_repair
      auto_upgrade = management.value.auto_upgrade
    }
  }

  dynamic "network_config" {
    for_each = each.value.network_config != null ? [each.value.network_config] : []
    content {
      accelerator_network_profile = network_config.value.accelerator_network_profile
      dynamic "additional_node_network_configs" {
        for_each = network_config.value.additional_node_network_configs != null ? network_config.value.additional_node_network_configs : []
        content {
          network    = additional_node_network_configs.value.network
          subnetwork = additional_node_network_configs.value.subnetwork
        }
      }
      dynamic "additional_pod_network_configs" {
        for_each = network_config.value.additional_pod_network_configs != null ? network_config.value.additional_pod_network_configs : []
        content {
          max_pods_per_node   = additional_pod_network_configs.value.max_pods_per_node
          secondary_pod_range = additional_pod_network_configs.value.secondary_pod_range
          subnetwork          = additional_pod_network_configs.value.subnetwork
        }
      }
      create_pod_range     = network_config.value.create_pod_range
      enable_private_nodes = network_config.value.enable_private_nodes
      dynamic "network_performance_config" {
        for_each = network_config.value.network_performance_config != null ? [network_config.value.network_performance_config] : []
        content {
          total_egress_bandwidth_tier = network_performance_config.value.total_egress_bandwidth_tier
        }
      }
      dynamic "pod_cidr_overprovision_config" {
        for_each = network_config.value.pod_cidr_overprovision_config != null ? [network_config.value.pod_cidr_overprovision_config] : []
        content {
          disabled = pod_cidr_overprovision_config.value.disabled
        }
      }
      pod_ipv4_cidr_block = network_config.value.pod_ipv4_cidr_block
      pod_range           = network_config.value.pod_range
      subnetwork          = network_config.value.subnetwork
    }
  }

  dynamic "node_config" {
    for_each = each.value.node_config != null ? [each.value.node_config] : []
    content {
      dynamic "advanced_machine_features" {
        for_each = node_config.value.advanced_machine_features != null ? [node_config.value.advanced_machine_features] : []
        content {
          enable_nested_virtualization = advanced_machine_features.value.enable_nested_virtualization
          performance_monitoring_unit  = advanced_machine_features.value.performance_monitoring_unit
          threads_per_core             = advanced_machine_features.value.threads_per_core
        }
      }
      dynamic "boot_disk" {
        for_each = node_config.value.boot_disk != null ? [node_config.value.boot_disk] : []
        content {
          disk_type              = boot_disk.value.disk_type
          provisioned_iops       = boot_disk.value.provisioned_iops
          provisioned_throughput = boot_disk.value.provisioned_throughput
          size_gb                = boot_disk.value.size_gb
        }
      }
      boot_disk_kms_key = node_config.value.boot_disk_kms_key
      dynamic "confidential_nodes" {
        for_each = node_config.value.confidential_nodes != null ? [node_config.value.confidential_nodes] : []
        content {
          confidential_instance_type = confidential_nodes.value.confidential_instance_type
          enabled                    = confidential_nodes.value.enabled
        }
      }
      dynamic "containerd_config" {
        for_each = node_config.value.containerd_config != null ? [node_config.value.containerd_config] : []
        content {
          dynamic "private_registry_access_config" {
            for_each = containerd_config.value.private_registry_access_config != null ? [containerd_config.value.private_registry_access_config] : []
            content {
              dynamic "certificate_authority_domain_config" {
                for_each = private_registry_access_config.value.certificate_authority_domain_config != null ? private_registry_access_config.value.certificate_authority_domain_config : []
                content {
                  fqdns = certificate_authority_domain_config.value.fqdns
                  gcp_secret_manager_certificate_config {
                    secret_uri = certificate_authority_domain_config.value.gcp_secret_manager_certificate_config.secret_uri
                  }
                }
              }
              enabled = private_registry_access_config.value.enabled
            }
          }
          dynamic "registry_hosts" {
            for_each = containerd_config.value.registry_hosts != null ? containerd_config.value.registry_hosts : []
            content {
              dynamic "hosts" {
                for_each = registry_hosts.value.hosts != null ? registry_hosts.value.hosts : []
                content {
                  dynamic "ca" {
                    for_each = hosts.value.ca != null ? hosts.value.ca : []
                    content {
                      gcp_secret_manager_secret_uri = ca.value.gcp_secret_manager_secret_uri
                    }
                  }
                  capabilities = hosts.value.capabilities
                  dynamic "client" {
                    for_each = hosts.value.client != null ? hosts.value.client : []
                    content {
                      cert {
                        gcp_secret_manager_secret_uri = client.value.cert.gcp_secret_manager_secret_uri
                      }
                      dynamic "key" {
                        for_each = client.value.key != null ? [client.value.key] : []
                        content {
                          gcp_secret_manager_secret_uri = key.value.gcp_secret_manager_secret_uri
                        }
                      }
                    }
                  }
                  dial_timeout = hosts.value.dial_timeout
                  dynamic "header" {
                    for_each = hosts.value.header != null ? hosts.value.header : []
                    content {
                      key   = header.value.key
                      value = header.value.value
                    }
                  }
                  host          = hosts.value.host
                  override_path = hosts.value.override_path
                }
              }
              server = registry_hosts.value.server
            }
          }
          dynamic "writable_cgroups" {
            for_each = containerd_config.value.writable_cgroups != null ? [containerd_config.value.writable_cgroups] : []
            content {
              enabled = writable_cgroups.value.enabled
            }
          }
        }
      }
      disk_size_gb                = node_config.value.disk_size_gb
      disk_type                   = node_config.value.disk_type
      enable_confidential_storage = node_config.value.enable_confidential_storage
      dynamic "ephemeral_storage_local_ssd_config" {
        for_each = node_config.value.ephemeral_storage_local_ssd_config != null ? [node_config.value.ephemeral_storage_local_ssd_config] : []
        content {
          data_cache_count = ephemeral_storage_local_ssd_config.value.data_cache_count
          local_ssd_count  = ephemeral_storage_local_ssd_config.value.local_ssd_count
        }
      }
      dynamic "fast_socket" {
        for_each = node_config.value.fast_socket != null ? [node_config.value.fast_socket] : []
        content {
          enabled = fast_socket.value.enabled
        }
      }
      flex_start = node_config.value.flex_start
      dynamic "gcfs_config" {
        for_each = node_config.value.gcfs_config != null ? [node_config.value.gcfs_config] : []
        content {
          enabled = gcfs_config.value.enabled
        }
      }
      gpudirect_strategy = node_config.value.gpudirect_strategy
      dynamic "guest_accelerator" {
        for_each = node_config.value.guest_accelerator != null ? node_config.value.guest_accelerator : []
        content {
          count = guest_accelerator.value.count
          dynamic "gpu_driver_installation_config" {
            for_each = guest_accelerator.value.gpu_driver_installation_config != null ? [guest_accelerator.value.gpu_driver_installation_config] : []
            content {
              gpu_driver_version = gpu_driver_installation_config.value.gpu_driver_version
            }
          }
          gpu_partition_size = guest_accelerator.value.gpu_partition_size
          dynamic "gpu_sharing_config" {
            for_each = guest_accelerator.value.gpu_sharing_config != null ? [guest_accelerator.value.gpu_sharing_config] : []
            content {
              gpu_sharing_strategy       = gpu_sharing_config.value.gpu_sharing_strategy
              max_shared_clients_per_gpu = gpu_sharing_config.value.max_shared_clients_per_gpu
            }
          }
          type = guest_accelerator.value.type
        }
      }
      dynamic "gvnic" {
        for_each = node_config.value.gvnic != null ? [node_config.value.gvnic] : []
        content {
          enabled = gvnic.value.enabled
        }
      }
      image_type = node_config.value.image_type
      dynamic "kubelet_config" {
        for_each = node_config.value.kubelet_config != null ? [node_config.value.kubelet_config] : []
        content {
          allowed_unsafe_sysctls  = kubelet_config.value.allowed_unsafe_sysctls
          container_log_max_files = kubelet_config.value.container_log_max_files
          container_log_max_size  = kubelet_config.value.container_log_max_size
          cpu_cfs_quota           = kubelet_config.value.cpu_cfs_quota
          cpu_cfs_quota_period    = kubelet_config.value.cpu_cfs_quota_period
          cpu_manager_policy      = kubelet_config.value.cpu_manager_policy
          dynamic "crash_loop_back_off" {
            for_each = kubelet_config.value.crash_loop_back_off != null ? [kubelet_config.value.crash_loop_back_off] : []
            content {
              max_container_restart_period = crash_loop_back_off.value.max_container_restart_period
            }
          }
          eviction_max_pod_grace_period_seconds = kubelet_config.value.eviction_max_pod_grace_period_seconds
          dynamic "eviction_minimum_reclaim" {
            for_each = kubelet_config.value.eviction_minimum_reclaim != null ? [kubelet_config.value.eviction_minimum_reclaim] : []
            content {
              imagefs_available   = eviction_minimum_reclaim.value.imagefs_available
              imagefs_inodes_free = eviction_minimum_reclaim.value.imagefs_inodes_free
              memory_available    = eviction_minimum_reclaim.value.memory_available
              nodefs_available    = eviction_minimum_reclaim.value.nodefs_available
              nodefs_inodes_free  = eviction_minimum_reclaim.value.nodefs_inodes_free
              pid_available       = eviction_minimum_reclaim.value.pid_available
            }
          }
          dynamic "eviction_soft" {
            for_each = kubelet_config.value.eviction_soft != null ? [kubelet_config.value.eviction_soft] : []
            content {
              imagefs_available   = eviction_soft.value.imagefs_available
              imagefs_inodes_free = eviction_soft.value.imagefs_inodes_free
              memory_available    = eviction_soft.value.memory_available
              nodefs_available    = eviction_soft.value.nodefs_available
              nodefs_inodes_free  = eviction_soft.value.nodefs_inodes_free
              pid_available       = eviction_soft.value.pid_available
            }
          }
          dynamic "eviction_soft_grace_period" {
            for_each = kubelet_config.value.eviction_soft_grace_period != null ? [kubelet_config.value.eviction_soft_grace_period] : []
            content {
              imagefs_available   = eviction_soft_grace_period.value.imagefs_available
              imagefs_inodes_free = eviction_soft_grace_period.value.imagefs_inodes_free
              memory_available    = eviction_soft_grace_period.value.memory_available
              nodefs_available    = eviction_soft_grace_period.value.nodefs_available
              nodefs_inodes_free  = eviction_soft_grace_period.value.nodefs_inodes_free
              pid_available       = eviction_soft_grace_period.value.pid_available
            }
          }
          image_gc_high_threshold_percent        = kubelet_config.value.image_gc_high_threshold_percent
          image_gc_low_threshold_percent         = kubelet_config.value.image_gc_low_threshold_percent
          image_maximum_gc_age                   = kubelet_config.value.image_maximum_gc_age
          image_minimum_gc_age                   = kubelet_config.value.image_minimum_gc_age
          insecure_kubelet_readonly_port_enabled = kubelet_config.value.insecure_kubelet_readonly_port_enabled
          max_parallel_image_pulls               = kubelet_config.value.max_parallel_image_pulls
          dynamic "memory_manager" {
            for_each = kubelet_config.value.memory_manager != null ? [kubelet_config.value.memory_manager] : []
            content {
              policy = memory_manager.value.policy
            }
          }
          pod_pids_limit                              = kubelet_config.value.pod_pids_limit
          shutdown_grace_period_critical_pods_seconds = kubelet_config.value.shutdown_grace_period_critical_pods_seconds
          shutdown_grace_period_seconds               = kubelet_config.value.shutdown_grace_period_seconds
          single_process_oom_kill                     = kubelet_config.value.single_process_oom_kill
          dynamic "topology_manager" {
            for_each = kubelet_config.value.topology_manager != null ? [kubelet_config.value.topology_manager] : []
            content {
              policy = topology_manager.value.policy
              scope  = topology_manager.value.scope
            }
          }
        }
      }
      labels = node_config.value.labels
      dynamic "linux_node_config" {
        for_each = node_config.value.linux_node_config != null ? [node_config.value.linux_node_config] : []
        content {
          dynamic "accurate_time_config" {
            for_each = linux_node_config.value.accurate_time_config != null ? [linux_node_config.value.accurate_time_config] : []
            content {
              enable_ptp_kvm_time_sync = accurate_time_config.value.enable_ptp_kvm_time_sync
            }
          }
          cgroup_mode = linux_node_config.value.cgroup_mode
          dynamic "custom_node_init" {
            for_each = linux_node_config.value.custom_node_init != null ? [linux_node_config.value.custom_node_init] : []
            content {
              dynamic "init_script" {
                for_each = custom_node_init.value.init_script != null ? [custom_node_init.value.init_script] : []
                content {
                  gcp_secret_manager_secret_uri = init_script.value.gcp_secret_manager_secret_uri
                  gcs_generation                = init_script.value.gcs_generation
                  gcs_uri                       = init_script.value.gcs_uri
                }
              }
            }
          }
          dynamic "hugepages_config" {
            for_each = linux_node_config.value.hugepages_config != null ? [linux_node_config.value.hugepages_config] : []
            content {
              hugepage_size_1g = hugepages_config.value.hugepage_size_1g
              hugepage_size_2m = hugepages_config.value.hugepage_size_2m
            }
          }
          dynamic "node_kernel_module_loading" {
            for_each = linux_node_config.value.node_kernel_module_loading != null ? [linux_node_config.value.node_kernel_module_loading] : []
            content {
              policy = node_kernel_module_loading.value.policy
            }
          }
          dynamic "swap_config" {
            for_each = linux_node_config.value.swap_config != null ? [linux_node_config.value.swap_config] : []
            content {
              dynamic "boot_disk_profile" {
                for_each = swap_config.value.boot_disk_profile != null ? [swap_config.value.boot_disk_profile] : []
                content {
                  swap_size_gib     = boot_disk_profile.value.swap_size_gib
                  swap_size_percent = boot_disk_profile.value.swap_size_percent
                }
              }
              dynamic "dedicated_local_ssd_profile" {
                for_each = swap_config.value.dedicated_local_ssd_profile != null ? [swap_config.value.dedicated_local_ssd_profile] : []
                content {
                  disk_count = dedicated_local_ssd_profile.value.disk_count
                }
              }
              enabled = swap_config.value.enabled
              dynamic "encryption_config" {
                for_each = swap_config.value.encryption_config != null ? [swap_config.value.encryption_config] : []
                content {
                  disabled = encryption_config.value.disabled
                }
              }
              dynamic "ephemeral_local_ssd_profile" {
                for_each = swap_config.value.ephemeral_local_ssd_profile != null ? [swap_config.value.ephemeral_local_ssd_profile] : []
                content {
                  swap_size_gib     = ephemeral_local_ssd_profile.value.swap_size_gib
                  swap_size_percent = ephemeral_local_ssd_profile.value.swap_size_percent
                }
              }
            }
          }
          sysctls                      = linux_node_config.value.sysctls
          transparent_hugepage_defrag  = linux_node_config.value.transparent_hugepage_defrag
          transparent_hugepage_enabled = linux_node_config.value.transparent_hugepage_enabled
        }
      }
      dynamic "local_nvme_ssd_block_config" {
        for_each = node_config.value.local_nvme_ssd_block_config != null ? [node_config.value.local_nvme_ssd_block_config] : []
        content {
          local_ssd_count = local_nvme_ssd_block_config.value.local_ssd_count
        }
      }
      local_ssd_count           = node_config.value.local_ssd_count
      local_ssd_encryption_mode = node_config.value.local_ssd_encryption_mode
      logging_variant           = node_config.value.logging_variant
      machine_type              = node_config.value.machine_type
      max_run_duration          = node_config.value.max_run_duration
      metadata                  = node_config.value.metadata
      min_cpu_platform          = node_config.value.min_cpu_platform
      node_group                = node_config.value.node_group
      dynamic "node_image_config" {
        for_each = node_config.value.node_image_config != null ? node_config.value.node_image_config : []
        content {
          image         = node_image_config.value.image
          image_project = node_image_config.value.image_project
        }
      }
      oauth_scopes = node_config.value.oauth_scopes
      preemptible  = node_config.value.preemptible
      dynamic "reservation_affinity" {
        for_each = node_config.value.reservation_affinity != null ? [node_config.value.reservation_affinity] : []
        content {
          consume_reservation_type = reservation_affinity.value.consume_reservation_type
          key                      = reservation_affinity.value.key
          values                   = reservation_affinity.value.values
        }
      }
      resource_labels       = node_config.value.resource_labels
      resource_manager_tags = node_config.value.resource_manager_tags
      dynamic "sandbox_config" {
        for_each = node_config.value.sandbox_config != null ? [node_config.value.sandbox_config] : []
        content {
          type = sandbox_config.value.type
        }
      }
      dynamic "secondary_boot_disks" {
        for_each = node_config.value.secondary_boot_disks != null ? node_config.value.secondary_boot_disks : []
        content {
          disk_image = secondary_boot_disks.value.disk_image
          mode       = secondary_boot_disks.value.mode
        }
      }
      service_account = node_config.value.service_account
      dynamic "shielded_instance_config" {
        for_each = node_config.value.shielded_instance_config != null ? [node_config.value.shielded_instance_config] : []
        content {
          enable_integrity_monitoring = shielded_instance_config.value.enable_integrity_monitoring
          enable_secure_boot          = shielded_instance_config.value.enable_secure_boot
        }
      }
      dynamic "sole_tenant_config" {
        for_each = node_config.value.sole_tenant_config != null ? [node_config.value.sole_tenant_config] : []
        content {
          min_node_cpus = sole_tenant_config.value.min_node_cpus
          dynamic "node_affinity" {
            for_each = sole_tenant_config.value.node_affinity
            content {
              key      = node_affinity.value.key
              operator = node_affinity.value.operator
              values   = node_affinity.value.values
            }
          }
        }
      }
      spot          = node_config.value.spot
      storage_pools = node_config.value.storage_pools
      tags          = node_config.value.tags
      dynamic "taint" {
        for_each = node_config.value.taint != null ? node_config.value.taint : []
        content {
          effect = taint.value.effect
          key    = taint.value.key
          value  = taint.value.value
        }
      }
      dynamic "taint_config" {
        for_each = node_config.value.taint_config != null ? [node_config.value.taint_config] : []
        content {
          architecture_taint_behavior = taint_config.value.architecture_taint_behavior
        }
      }
      dynamic "windows_node_config" {
        for_each = node_config.value.windows_node_config != null ? [node_config.value.windows_node_config] : []
        content {
          osversion = windows_node_config.value.osversion
        }
      }
      dynamic "workload_metadata_config" {
        for_each = node_config.value.workload_metadata_config != null ? [node_config.value.workload_metadata_config] : []
        content {
          mode = workload_metadata_config.value.mode
        }
      }
    }
  }

  dynamic "node_drain_config" {
    for_each = each.value.node_drain_config != null ? each.value.node_drain_config : []
    content {
      grace_termination_duration            = node_drain_config.value.grace_termination_duration
      pdb_timeout_duration                  = node_drain_config.value.pdb_timeout_duration
      respect_pdb_during_node_pool_deletion = node_drain_config.value.respect_pdb_during_node_pool_deletion
    }
  }

  dynamic "placement_policy" {
    for_each = each.value.placement_policy != null ? [each.value.placement_policy] : []
    content {
      policy_name  = placement_policy.value.policy_name
      tpu_topology = placement_policy.value.tpu_topology
      type         = placement_policy.value.type
    }
  }

  dynamic "queued_provisioning" {
    for_each = each.value.queued_provisioning != null ? [each.value.queued_provisioning] : []
    content {
      enabled = queued_provisioning.value.enabled
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "upgrade_settings" {
    for_each = each.value.upgrade_settings != null ? [each.value.upgrade_settings] : []
    content {
      dynamic "blue_green_settings" {
        for_each = upgrade_settings.value.blue_green_settings != null ? [upgrade_settings.value.blue_green_settings] : []
        content {
          node_pool_soak_duration = blue_green_settings.value.node_pool_soak_duration
          standard_rollout_policy {
            batch_node_count    = blue_green_settings.value.standard_rollout_policy.batch_node_count
            batch_percentage    = blue_green_settings.value.standard_rollout_policy.batch_percentage
            batch_soak_duration = blue_green_settings.value.standard_rollout_policy.batch_soak_duration
          }
        }
      }
      max_surge       = upgrade_settings.value.max_surge
      max_unavailable = upgrade_settings.value.max_unavailable
      strategy        = upgrade_settings.value.strategy
    }
  }
}

