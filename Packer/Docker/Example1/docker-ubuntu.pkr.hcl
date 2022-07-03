### Variables Section
variable "docker_image" {
  type    = string
  default = "ubuntu:xenial"
}

### Plugins / Builders
packer {
  required_plugins {
    docker = {
      version = "= 1.0.1"
      source  = "github.com/hashicorp/docker"
    }
  }
}

### Sources
source "docker" "ubuntu" {
  image  = var.docker_image
  commit = true
}

source "docker" "ubuntu-bionic" {
  image  = "ubuntu:bionic"
  commit = true
}

### Build Block
build {
  name = "learn-packer"
  ### Parallel Builds
  sources = [
    "source.docker.ubuntu",
    "source.docker.ubuntu-bionic",
  ]

  ### Provisioner - Shell
  provisioner "shell" {
    environment_vars = [
      "FOO=Hello World",
    ]

    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt",
    ]
  }

  ### Provisioner - Shell
  provisioner "shell" {
    inline = ["echo Running ${var.docker_image} Docker Image"]
  }

  ### Post-Processor - Single
  post-processor "docker-tag" {
    repository = "ashokkumarchoppadandi/my-ubuntu"
    tags       = ["packer-ubuntu-1.0", "packer-rocks-1"]
  }

  ### Post-Processor - Multi
  post-processors {
    post-processor "docker-tag" {
      repository = "ashokkumarchoppadandi/my-ubuntu"
      tags       = ["packer-ubuntu-1.0", "packer-rocks-1"]
    }

    post-processor "docker-push" {}
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "ashokkumarchoppadandi/my-ubuntu-bionic"
      tags       = ["packer-ubuntu-bionic-1.0", "packer-rocks-2"]
    }

    post-processor "docker-push" {}
  }
}

