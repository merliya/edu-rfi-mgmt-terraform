module "aws_account" {
  source      = "app.terraform.io/uopx/account-ids/aws"
  environment = var.environment
}
