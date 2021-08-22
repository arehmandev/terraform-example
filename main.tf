terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}
# Create Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}
# Docker container base image to use
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Create resource nginx container
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
# feature branch3
# Create docker container
output "docker-id" {
  value       = docker_container.nginx.id
  description = "docker image id"
}

# output container image
output "docker-name" {
  value       = docker_container.nginx.name
  description = "docker image name"
}