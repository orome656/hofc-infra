provider "docker" {
  host = "ssh://${var.user}@${var.host}:22"


  registry_auth {
    address = "docker.pkg.github.com"
    username = var.registry_user
    password = var.registry_pass
  }
}