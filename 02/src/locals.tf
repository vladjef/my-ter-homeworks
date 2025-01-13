locals {
  vm_names_list = {
    vm_web_name = var.yandex_compute_instance_name
    vm_db_name = var.vm_db_yandex_compute_instance_name
  }
}