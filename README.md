# Terraform Module Docker

Terraform module which installs and configures ningx.

This is a terraform replacement for [Ansible Role Docker](https://github.com/l-with/ansible-role-docker).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_system"></a> [system](#requirement\_system) | >= 0.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_system"></a> [system](#provider\_system) | 0.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [system_file.etc_docker_daemon_json](https://registry.terraform.io/providers/neuspaces/system/latest/docs/resources/file) | resource |
| [system_folder.etc_apt_keyrings](https://registry.terraform.io/providers/neuspaces/system/latest/docs/resources/folder) | resource |
| [system_packages_apt.docker_packages](https://registry.terraform.io/providers/neuspaces/system/latest/docs/resources/packages_apt) | resource |
| [system_command.apt_cache_update](https://registry.terraform.io/providers/neuspaces/system/latest/docs/data-sources/command) | data source |
| [system_command.docker_reposistory](https://registry.terraform.io/providers/neuspaces/system/latest/docs/data-sources/command) | data source |
| [system_command.docker_repository_signing_key](https://registry.terraform.io/providers/neuspaces/system/latest/docs/data-sources/command) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_docker_manipulate_iptables_rules"></a> [docker\_manipulate\_iptables\_rules](#input\_docker\_manipulate\_iptables\_rules) | if docker can manipulate iptable rules | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
