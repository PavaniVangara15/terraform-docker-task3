terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

# Docker provider configuration for local Docker Desktop on Windows
provider "docker" {
  # Docker Desktop on Windows exposes the engine via a named pipe
  host = "npipe:////./pipe/docker_engine"
}

# Pull the hello-world image from Docker Hub
resource "docker_image" "hello" {
  name = "hello-world:latest"
}

# Create a container from that image
resource "docker_container" "hello_container" {
  name  = "pavani-hello"
  image = docker_image.hello.name
}