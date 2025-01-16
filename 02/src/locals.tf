locals {
  project       = "netology"
  stream        = "develop"
  env           = "platform"
  app_host_name = "web"
  db_host_mane  = "db"
  vm_names_list = {
    vm_web_name = "${local.project}-${local.stream}-${local.env}-${local.app_host_name}"
    vm_db_name = "${local.project}-${local.stream}-${local.env}-${local.db_host_mane}"
  }
}