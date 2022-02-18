terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, < 4.0"
    }
  }

  backend "remote" {
    hostname     = "terraform.mgmt.uopx.io"
    organization = "uopx"

    workspaces {
      name = "react-rfi-app"
    }
  }
}