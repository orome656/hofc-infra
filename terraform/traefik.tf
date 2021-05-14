resource "docker_image" "traefik" {
  name = "traefik:v2.4"
}


resource "docker_container" "traefik" {
  name  = "traefik"
  image = docker_image.traefik.latest
  restart = "unless-stopped"
  networks_advanced = {
      name = docker_network.private_network.name
      alias = "traefik"
  }
  ports = {
      internal = "443"
      external = "8443"
  }

  volumes = {
      host_path = "/var/run/docker.sock"
      container_path = "/var/run/docker.sock"
  }
  labels = {
      label = "traefik.http.routers.fff_system.rule"
      value = "Host(`fff-system.internal-api.maladot.ovh`)"
  }
}