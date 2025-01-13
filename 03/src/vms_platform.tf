
variable "yandex_compute_instance_count" {
  type        = number
  default     = 2
  description = "Quantity of VM"
}

variable "yandex_compute_instance_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "standard-v1"
}

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
    }
  }
}

# variable "vms_ssh_root_key" {
#   type        = string
#   # default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE/l7aD5x+bX9c0L7odxlFD1wTreEcXJDZ/Cb/aKFj3E admin@ubuntu-50"
#   default     = ""
#   description = "ssh-keygen -t ed25519"
# }

variable "vms_db_each" {
  type = list(object({
    vm_name       = string,
    cores         = number,
    memory        = number,
    disk_volume   = number,
    core_fraction = number
  }))
  default = [
    {
      vm_name="main",
      cores=2,
      memory=1,
      disk_volume=7,
      core_fraction = 5
    },
    {
      vm_name="replica",
      cores=4,
      memory=2,
      disk_volume=10,
      core_fraction = 20
    }
  ]
}