locals {
  db = [for i in yandex_compute_instance.db : {
    name = i.hostname,
    id = i.id,
    fqdn = i.fqdn
  }]
  web = [for i in yandex_compute_instance.web : {
    name = i.hostname,
    id = i.id,
    fqdn = i.fqdn
  }]
  storage = [for i in [yandex_compute_instance.storage-vm] : {
    name = i.hostname,
    id = i.id,
    fqdn = i.fqdn
  }]
}

output "vm_output" {
  value = [ for i in concat(local.web, local.db, local.storage) : {
      name = i.name
      id = i.id
      fqdn = i.fqdn
    }
  ]
}