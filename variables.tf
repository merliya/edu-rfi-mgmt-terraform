
###########  ENVIRONMENT #######
################################
variable "environment" {
  description = "AWS environment."
  type        = string
}
variable "region" {
  description = "AWS region."
  type        = string
}
variable "name_prefix" {
  description = "Name prefix for resources."
  type        = string
}

variable "account_id_mgmt" {
  type    = string
  default = "050853773894"
}

################################
##############  TAGS ###########
################################
variable "tag_application_key" {
  description = "AppDB Application key."
  type        = string
}
variable "tag_created_by" {
  description = "Email address of who created the resources."
  type        = string
}
variable "tag_module_key" {
  description = "AppDB Module key."
  type        = string
}
variable "tag_map_migrated" {
  description = "MAP migrated tag for discounts."
  type        = string
}

##################################
######  PIPELINE - GLOBAL ########
##################################
variable "connection_arn" {}
variable "s3bucket" {}
variable "account_id" {}

################################
######  COMMON PIPELINE ########
################################
variable "common_app_name" {}
variable "common_codepipeline_role_arn" {}
variable "common_iam_role_name" {}

variable "common_bitbucket_repo" {}
variable "common_bitbucket_branch_name" {}
variable "common_bitbucket_release_branch_name" {}

##############  edu_rfi_react PIPELINE ########
variable "edu_rfi_react_app_name" {
  type = string
}
variable "edu_rfi_react_bitbucket_repo" {
  type = string
}
variable "edu_rfi_react_ecr_repo_name" {
  type = string
}
variable "edu_rfi_react_ecr_repo_uri" {
  type = string
}
variable "edu_rfi_react_tag_module_key" {
  type = string
}
variable "edu_rfi_react_tag_created_by" {
  type = string
}
variable "edu_rfi_react_tag_map_migrated" {
  type = string
}
##############  edu_rfi_react PIPELINE ########

##############  edu_rfi_react_helm PIPELINE ########
variable "edu_rfi_react_helm_app_name" {
  type = string
}
variable "edu_rfi_react_helm_bitbucket_repo" {
  type = string
}
variable "edu_rfi_react_helm_tag_module_key" {
  type = string
}
variable "edu_rfi_react_helm_tag_created_by" {
  type = string
}
variable "edu_rfi_react_helm_tag_map_migrated" {
  type = string
}
##############  edu_rfi_react PIPELINE ########