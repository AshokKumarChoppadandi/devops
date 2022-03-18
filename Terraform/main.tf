terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
  keep_locally = true
}

# Create a container
resource "docker_container" "foo" {
  image = docker_image.ubuntu.name
  name  = "foo"
  command = ["tail", "-f", "/dev/null"]
}
