# @Author: Fabrice Krebs
# @Date:   28-10-2022 13:58:21
# @Last Modified by:   Wolfgang Huse
# @Last Modified time: 02-05-2023 07:14:54

build {
  source "nutanix.windows2019" {
    name = "windows2019"
  }
  source "nutanix.windows2022" {
    name = "windows2022"
  }

  #execute the install script to install customer settings
  provisioner "powershell" {
    scripts = ["scripts/install.ps1"]
    elevated_user = var.administrator_username
    elevated_password = var.administrator_password
  }
  #execute the powershell script to install cloudbase-init
  provisioner "powershell" {
    scripts = ["scripts/cloudbase-init.ps1"]
    elevated_user = var.administrator_username
    elevated_password = var.administrator_password
  }
  
  #  #push the cloudbase-init config
  provisioner "file" {
    source = "scripts/cloudbase-init.conf"
    destination = "C:\\Program Files\\Cloudbase Solutions\\Cloudbase-Init\\conf\\cloudbase-init.conf"
  }
}
