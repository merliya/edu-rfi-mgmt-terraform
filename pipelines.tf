// module "edu_node_base-build-pipeline" {
//   source         = "./modules/build_pipeline_eks"
//   environment    = var.environment
//   app_name       = var.edu_node_base_app_name       // NOTE - Do not use underscores here
//   bitbucket_repo = var.edu_node_base_bitbucket_repo // The Bitbucket repository name to get the latest code(Bitbucket Cloud only)

//   ecr_repo_name = var.edu_node_base_ecr_repo_name
//   ecr_repo_uri  = var.edu_node_base_ecr_repo_uri

//   # Tagging 
//   tag_application_key = var.tag_application_key
//   tag_module_key      = var.edu_node_base_tag_module_key
//   tag_created_by      = var.edu_node_base_tag_created_by
//   tag_map_migrated    = var.edu_node_base_tag_map_migrated
// }

module "edu-rfi-react-build-pipeline" {
  source         = "./modules/build_pipeline_eks"
  environment    = var.environment
  app_name       = var.edu_rfi_react_app_name       // NOTE - Do not use underscores here
  bitbucket_repo = var.edu_rfi_react_bitbucket_repo // The Bitbucket repository name to get the latest code(Bitbucket Cloud only)

  ecr_repo_name = var.edu_rfi_react_ecr_repo_name
  ecr_repo_uri  = var.edu_rfi_react_ecr_repo_uri

  # Tagging 
  tag_application_key = var.tag_application_key
  tag_module_key      = var.edu_rfi_react_tag_module_key
  tag_created_by      = var.edu_rfi_react_tag_created_by
  tag_map_migrated    = var.edu_rfi_react_tag_map_migrated
}

module "edu-rfi-react-helm-deployment-pipeline" {
  source         = "./modules/deploy_pipeline_helm_eks"
  environment    = var.environment
  app_name       = var.edu_rfi_react_helm_app_name
  bitbucket_repo = var.edu_rfi_react_helm_bitbucket_repo
  tag_application_key = var.tag_application_key
  tag_module_key      = var.edu_rfi_react_helm_tag_module_key
  tag_created_by      = var.edu_rfi_react_helm_tag_created_by
  tag_map_migrated    = var.edu_rfi_react_helm_tag_map_migrated
  deploy_role_arn_nonprod  = "arn:aws:iam::363145861140:role/uopx-k8-nonprod-st-rfi-react-app-admin-role"
}