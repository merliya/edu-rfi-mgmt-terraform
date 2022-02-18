################ ENVIRONMENT ################
environment = "mgmt"
region      = "us-east-1"
name_prefix = "edu-rfi"

################ TAGS ################
tag_application_key  = "edu-rfi"
tag_created_by       = "4-mation@phoenix.edu"
tag_module_key       = "rfi_react_app"
tag_map_migrated     = "legacy_platform_uplift"


##############  PIPELINE - GLOBAL ######
connection_arn = "arn:aws:codestar-connections:us-east-1:050853773894:connection/946381bf-ccac-4954-b28d-bf81e672e11f"
s3bucket       = "codepipeline-us-east-1-196264113260"
account_id     = "050853773894"


##############  COMMON PIPELINE #######
common_app_name              = "edu_rfi_react_app"
common_codepipeline_role_arn = "arn:aws:iam::050853773894:role/rfi_react_app_pipeline_role"
common_iam_role_name         = "edu-rfi-react-ecs-code-pipeline-iam"

common_bitbucket_repo                = "codeuopx/rfi-react-app-mgmt-terraform"
common_bitbucket_branch_name         = "master"
common_bitbucket_release_branch_name = "release/latest"

##############  edu_rfi_react_app PIPELINE ########
edu_rfi_react_app_name       = "edu-rfi-react-app"
edu_rfi_react_bitbucket_repo = "codeuopx/rfi-react-app"
edu_rfi_react_ecr_repo_name  = "rfi-react-app"
edu_rfi_react_ecr_repo_uri   = "050853773894.dkr.ecr.us-east-1.amazonaws.com/rfi-react-app:1.0.593R"
edu_rfi_react_tag_module_key = "rfi_react_app"
edu_rfi_react_tag_created_by = "4-mation@phoenix.edu"
edu_rfi_react_tag_map_migrated = "legacy_platform_uplift"
##############  edu_rfi_react_app PIPELINE ########

##############   edu_rfi_react_app  PIPELINE ########
edu_rfi_react_helm_app_name       = "edu-rfi-react-helm"
edu_rfi_react_helm_bitbucket_repo = "codeuopx/edu_rfi_react_helm"
edu_rfi_react_helm_tag_module_key = "rfi_react_app"
edu_rfi_react_helm_tag_created_by = "4-mation@phoenix.edu"
edu_rfi_react_helm_tag_map_migrated = "legacy_platform_uplift"
##############   edu_rfi_react_app  PIPELINE ########