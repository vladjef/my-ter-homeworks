resource "yandex_compute_disk" "disk" {
  count    = var.yandex_compute_disk_count
  name     = "disk-${count.index + 1}"
  type     = var.disk_type
  size     = var.disk_size
  zone     = var.default_zone
  image_id = data.yandex_compute_image.ubuntu.image_id
}
