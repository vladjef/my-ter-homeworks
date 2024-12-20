# ###cloud vars
#
#
# variable "cloud_id" {
#   type        = string
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
# }
#
# variable "folder_id" {
#   type        = string
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
# }
#
# variable "default_zone" {
#   type        = string
#   default     = "ru-central1-a"
#   description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
# }
# variable "default_cidr" {
#   type        = list(string)
#   default     = ["10.0.1.0/24"]
#   description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
# }
#
# variable "vpc_name" {
#   type        = string
#   default     = "develop"
#   description = "VPC network & subnet name"
# }
#
#
# ###ssh vars
#
# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE/l7aD5x+bX9c0L7odxlFD1wTreEcXJDZ/Cb/aKFj3E admin@ubuntu-50"
#   description = "ssh-keygen -t ed25519"
# }
#
# variable "yandex_compute_instance_name" {
#   type        = string
#   default     = "netology-develop-platform-web"
#   description = "yandex_compute_instance name"
# }
#
# variable "yandex_compute_instance_platform_id" {
#   type        = string
#   default     = "standard-v1"
#   description = "standard-v1"
# }
#
# variable "yandex_compute_instance_cores" {
#   type        = number
#   default     = 2
#   description = "2"
# }
# variable "yandex_compute_instance_memory" {
#   type        = number
#   default     = 1
#   description = "1"
# }
# variable "yandex_compute_instance_core_fraction" {
#   type        = number
#   default     = 5
#   description = "5"
# }