# @Author: Fabrice Krebs
# @Date:   28-10-2022 13:58:21
# @Last Modified by:   Wolfgang Huse
# @Last Modified time: 02-05-2023 07:17:11

variable "nutanix_username" {
  type = string
}

variable "nutanix_password" {
  type =  string
  sensitive = true
}

variable "nutanix_endpoint" {
  type = string
}

variable "nutanix_port" {
  type = number
}

variable "nutanix_insecure" {
  type = bool
  default = true
}

variable "nutanix_subnet" {
  type = string
}

variable "nutanix_cluster" {
  type = string
}

variable "windows_2019_iso_image_name" {
  type = string
}

variable "windows_2022_iso_image_name" {
  type = string
}

variable "virtio_iso_image_name" {
  type = string
}

variable "image_name" {
  type = string
}

variable "administrator_username" {
  type = string
}

variable "administrator_password" {
  type = string
  sensitive = true
}