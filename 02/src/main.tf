resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "vm_web_develop" {
  name           = var.vm_web_vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
resource "yandex_vpc_subnet" "vm_db_develop" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "platform" {
  name        = var.yandex_compute_instance_name
  platform_id = var.yandex_compute_instance_platform_id
  resources {
    cores         = var.yandex_compute_instance_cores
    memory        = var.yandex_compute_instance_memory
    core_fraction = var.yandex_compute_instance_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.vm_web_develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

resource "yandex_compute_instance" "platform_db" {
  name        = var.vm_db_yandex_compute_instance_name
  platform_id = var.vm_db_yandex_compute_instance_platform_id
  zone        = var.vm_db_zone
  resources {
    cores         = var.vm_db_yandex_compute_instance_cores
    memory        = var.vm_db_yandex_compute_instance_memory
    core_fraction = var.vm_db_yandex_compute_instance_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.vm_db_develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
