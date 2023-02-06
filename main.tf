resource "system_file" "etc_docker_daemon_json" {
  count   = var.docker_manipulate_iptables_rules ? 0 : 1
  path    = "/etc/docker/daemon.json"
  mode    = 640
  content = <<EOT
{ 
  "iptables": false 
}
    EOT
}

resource "system_folder" "etc_apt_keyrings" {
  path = "/etc/apt/keyrings"
  mode = 755
}

data "system_command" "docker_repository_signing_key" {
  depends_on = [system_folder.etc_apt_keyrings]
  command    = "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg --batch --yes"
  expect {
    stdout = true
    stderr = true
  }
}

data "system_command" "docker_reposistory" {
  depends_on = [
    data.system_command.docker_repository_signing_key
  ]
  command = "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | tee /etc/apt/sources.list.d/docker.list > /dev/null"
}

data "system_command" "apt_cache_update" {
  depends_on = [data.system_command.docker_reposistory]
  command    = "apt update"
}

locals {
  packages = [
    "docker-ce",
    "docker-ce-cli",
    "containerd.io",
    "docker-compose-plugin",
  ]
}

resource "system_packages_apt" "docker_packages" {
  depends_on = [data.system_command.apt_cache_update]
  for_each   = toset(local.packages)
  package {
    name = each.key
  }
}
