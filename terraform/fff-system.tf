
resource "docker_image" "fff_system" {
  name = "docker.pkg.github.com/orome656/fff-system-api/fff-system-api:latest"
}

resource "docker_container" "fff_system" {
  name  = "fff-system"
  image = docker_image.fff_system.latest
  restart = "unless-stopped"
  networks_advanced = {
      name = docker_network.private_network.name
      alias = "fff-system"
  }
  env   = [
      "api_user=${var.api_user}",
      "api_password=${var.api_password}",
      "fff_client_id=${var.fff_client_id}",
      "fff_client_secret=${var.fff_client_secret}",
      "fff_username=${var.fff_username}",
      "fff_password=${var.fff_password}",
      "fff_token_password=${var.fff_token_password}"
  ]
}
