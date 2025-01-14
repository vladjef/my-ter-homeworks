variable "yandex_compute_disk_count" {
  type        = number
  default     = 3
  description = "Quantity of disks"
}
variable "disk_type" {
  type        = string
  default     = "network-hdd"
  description = "Disk type"
}
variable "disk_size" {
  type        = number
  default     = 5
  description = "Disk size"
}