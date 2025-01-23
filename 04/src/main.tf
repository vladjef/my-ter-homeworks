resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name[0]
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.subnet_zone]
  subnet_ids     = [yandex_vpc_subnet.develop.id]
  instance_name  = var.instance_name[0]
  instance_count = var.instance_count
  image_family   = var.image_family
  public_ip      = var.public_ip

  labels = {
    project = var.project[0]
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = var.serial-port-enable
  }
}

module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name[1]
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.subnet_zone]
  subnet_ids     = [yandex_vpc_subnet.develop.id]
  instance_name  = var.instance_name[1]
  instance_count = var.instance_count
  image_family   = var.image_family
  public_ip      = var.public_ip

  labels = {
    project = var.project[1]
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = var.serial-port-enable
  }
}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username       = local.vms_ssh_username
    ssh_public_key = file(local.vms_ssh_root_key_path)
    packages       = jsonencode(var.packages)
  }
}