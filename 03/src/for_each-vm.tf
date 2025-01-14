resource "yandex_compute_instance" "db" {
  for_each    = { for key, value in var.vms_db_each : key => value }
  name        = "${each.value.vm_name}"
  hostname    = "${each.value.vm_name}"
  platform_id = var.yandex_compute_instance_platform_id
  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = "network-hdd"
      size = each.value.disk_volume
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