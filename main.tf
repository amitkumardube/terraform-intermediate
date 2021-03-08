// This is called terraform settings block
terraform {
  // to mention what terraform CLI version should process this module
  required_version = ">=0.14"
  // this blocks declares a google provider with specific version
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.58.0"
    }
  }
  // to use an experimental feature
  experiments = [provider_sensitive_attrs]

  // to use a backend other than local. Local is default
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "abc"

    workspaces {
      name = "def"
    }
  }
}

// since we have declared the provider google, let's declare the provider block with required configuration

provider "google" {
    project = var.provider_config["project_id"]
    region = var.provider_config["region"]
    zone = var.provider_config["zone"]
    credentials = file("my-first-project-298218-a7316b8c9560.json")
}

module "count_instance" {
    source = "./count"
    vm_names = var.count_vm_names
}

module "for_each_instance" {
    source = "./for_each"
    vm_names = var.for_each_vm_names
    tags = var.tags
}