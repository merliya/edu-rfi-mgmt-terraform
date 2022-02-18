provider "aws" {
  # alias   = "mgmt"
  region  = "us-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::${var.account_id_mgmt}:role/tfe_developer"
    session_name = "rfi-react-app-terraform-${var.environment}"
  }
}
