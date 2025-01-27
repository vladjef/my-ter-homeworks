resource "yandex_vpc_network" "develop" {
  name = var.name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.name
  zone           = var.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.v4_cidr_blocks
}

variable "name" {
  type = string
}

variable "zone" {
  type = string
}

variable "v4_cidr_blocks" {
  type = list
}