terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.76"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
  }
  required_version = "~> 1.3"
}
