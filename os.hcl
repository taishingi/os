packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "arch" {
  image  = "archlinux:latest"
  commit = false
  discard = true
}

source "docker" "fedora" {
  image  = "fedora:latest"
  commit = false
  discard = true
}

source "docker" "debian" {
  image  = "debian:latest"
  commit = false
  discard = true
}

build {
  name    = "debian"
  sources = [
    "source.docker.debian",
  ]
   provisioner "shell" {
   scripts = ["debian.sh"]
  }
}

build {
  name    = "arch"
  sources = [
    "source.docker.arch",
  ]
   provisioner "shell" {
   scripts = ["arch.sh"]
  }
}

build {
  name    = "fedora"
  sources = [
    "source.docker.fedora",
  ]
   provisioner "shell" {
   scripts = ["fedora.sh"]
  }
}
