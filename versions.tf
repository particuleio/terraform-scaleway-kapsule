terraform {

  experiments = [module_variable_optional_attrs]

  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.2.0"
    }
  }
  required_version = ">= 0.14"
}
