terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = "~>1.8.4" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {}
/*
provider "docker" {
  host     = "ssh://admin@51.250.44.14:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-i", "id_ed25519"]
}
*/

#однострочный комментарий

resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "root_random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql_image" {
  name         = "mysql:8"
  keep_locally = false
}

resource "docker_container" "mysql" {
  name = "mysql"
  image = docker_image.mysql_image.image_id
  env = ["MYSQL_ROOT_PASSWORD = 3232342342423334","MYSQL_DATABASE=wordpress","MYSQL_USER=wordpress"]
  ports {
    internal = 3306
    external = 3306
  }
}
