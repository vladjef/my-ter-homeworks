output "network_id" {
  value = yandex_vpc_network.develop.id
}

output "subnet_ids" {
  value = yandex_vpc_subnet.develop.id
}
