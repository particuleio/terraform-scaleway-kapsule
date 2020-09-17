terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 1.16"
    }
  }
  required_version = ">= 0.13"
}
