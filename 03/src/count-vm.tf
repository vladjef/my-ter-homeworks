resource "yandex_compute_instance" "web" {
  depends_on = [yandex_compute_instance.db]
  count       = var.yandex_compute_instance_count
  name        = "web-${count.index + 1}"
  platform_id = var.yandex_compute_instance_platform_id
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
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
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.vms_ssh_root_key}"
  }

}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}