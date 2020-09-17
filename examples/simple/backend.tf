terraform {
  backend "remote" {
    organization = "clusterfrak-dynamics"

    workspaces {
      name = "tkap"
    }
  }
}
