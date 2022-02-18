resource "aws_codebuild_project" "common_codebuild" {
  name          = "${var.common_app_name}-codebuild"
  build_timeout = "30"
  service_role  = var.common_codepipeline_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }

  cache {
    type  = "LOCAL"
    modes = ["LOCAL_SOURCE_CACHE", "LOCAL_CUSTOM_CACHE"]
  }

  environment {
    compute_type                = "BUILD_GENERAL1_MEDIUM"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec.yml"
  }

  tags = local.ci_cd_tags

}

resource "aws_codepipeline" "common_codepipeline" {
  name     = "${var.common_app_name}-codepipeline"
  role_arn = var.common_codepipeline_role_arn

  artifact_store {
    location = var.s3bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        ConnectionArn    = var.connection_arn
        FullRepositoryId = var.common_bitbucket_repo
        BranchName       = var.common_bitbucket_branch_name
      }
    }
  }
  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.common_codebuild.name
      }
    }
  }

  tags = local.ci_cd_tags

}