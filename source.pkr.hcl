# @Author: Fabrice Krebs
# @Date:   28-10-2022 13:58:21
# @Last Modified by:   Wolfgang Huse
# @Last Modified time: 02-05-2023 07:22:11

packer {
  required_version = ">= 1.7.3"
  required_plugins {
    nutanix = {
      version = ">= 0.1.3"
      source  = "github.com/nutanix-cloud-native/nutanix"
    }
  }
}

source "nutanix" "windows" {
  nutanix_username = var.nutanix_username
  nutanix_password = var.nutanix_password
  nutanix_endpoint = var.nutanix_endpoint
  nutanix_insecure = var.nutanix_insecure
  cluster_name     = var.nutanix_cluster
  
  vm_disks {
      image_type = "ISO_IMAGE"
      source_image_name = var.windows_iso_image_name
      source_image_uri = var.windows_iso_image_uri
  }

  vm_disks {
      image_type = "ISO_IMAGE"
      source_image_name = var.virtio_iso_image_name
      source_image_uri = var.virtio_iso_image_uri
  }

  vm_disks {
      image_type = "DISK"
      disk_size_gb = 40
  }

  vm_nics {
    subnet_name       = var.nutanix_subnet
  }
  
  cd_files         = ["scripts/autounattend.xml",
                      "scripts/unattend.xml", 
                      "scripts/sysprep.bat", 
                      "scripts/cloudbase-init.conf"]
  
  image_name        = var.image_name
  shutdown_command = "F:/sysprep.bat"
  shutdown_timeout  = "10m"
  cpu               = 2
  os_type           = "Windows"
  memory_mb         = "8192"
  communicator      = "winrm"
  winrm_username    = "Administrator"
  winrm_password    = "nutanix/4u"
  winrm_port        = 5986
  winrm_insecure    = true
  winrm_use_ssl     = true
  winrm_timeout     = "45m"
}