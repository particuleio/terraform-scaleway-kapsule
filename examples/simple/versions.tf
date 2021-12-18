terraform {

  experiments = [module_variable_optional_attrs]

  required_providers {
    scaleway = {
      source  = "particuleio/scaleway"
      version = "2.2.0-rc.0"
    }
  }
  required_version = ">= 0.14"
}
