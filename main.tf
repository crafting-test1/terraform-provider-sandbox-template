terraform {
  required_providers {
    crafting = {
      source = "registry.terraform.io/crafting-dev/sandbox"
    }
  }
}


provider "crafting" {
  org        = "crafting"
  server_url = "https://sandboxes.cloud"
}

resource "crafting_template" "nvimc" {
  name       = "terraform-provider-demo"
  definition = <<-EOT
    workspaces:
    - name: dev
      checkouts:
        - path: sandbox-artifacts
          repo:
            git: https://github.com/crafting-dev/sandbox-artifacts.git
          version_spec: master
      packages:
        - name: golang
          version: 1.18.3
      env:
        - GOPATH=/home/owner/go
  EOT
}
