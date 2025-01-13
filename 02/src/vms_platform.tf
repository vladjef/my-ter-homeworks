###cloud vars

variable "cloud_id" {
  type        = string
  default     = "b1gai9q7g24vs528f0mj"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g824fnevfopjm44h1i"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}
variable "vm_db_vpc_name" {
  type        = string
  default     = "develop_db"
  description = "VPC network & subnet name"
}
variable "vm_web_vpc_name" {
  type        = string
  default     = "develop_web"
  description = "VPC network & subnet name"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE/l7aD5x+bX9c0L7odxlFD1wTreEcXJDZ/Cb/aKFj3E admin@ubuntu-50"
  description = "ssh-keygen -t ed25519"
}

variable "yandex_compute_instance_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "yandex_compute_instance name"
}

variable "vm_db_yandex_compute_instance_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "yandex_compute_instance name"
}

variable "yandex_compute_instance_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "standard-v1"
}

variable "vm_db_yandex_compute_instance_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "standard-v1"
}

# variable "yandex_compute_instance_cores" {
#   type        = number
#   default     = 2
#   description = "2"
# }
# variable "vm_db_yandex_compute_instance_cores" {
#   type        = number
#   default     = 2
#   description = "2"
# }
# variable "yandex_compute_instance_memory" {
#   type        = number
#   default     = 1
#   description = "1"
# }
# variable "vm_db_yandex_compute_instance_memory" {
#   type        = number
#   default     = 2
#   description = "2"
# }
# variable "yandex_compute_instance_core_fraction" {
#   type        = number
#   default     = 5
#   description = "5"
# }
# variable "vm_db_yandex_compute_instance_core_fraction" {
#   type        = number
#   default     = 20
#   description = "20"
# }
variable "vms_resources" {
  type = map(object({
    cores         = number
    core_fraction = number
    memory        = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    },
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}
variable metadata {
  type = map(string)
  default = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE/l7aD5x+bX9c0L7odxlFD1wTreEcXJDZ/Cb/aKFj3E admin@ubuntu-50"
  }
}