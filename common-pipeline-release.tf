resource "aws_codebuild_project" "common_codebuild_release" {
  name          = "${var.common_app_name}-codebuild-release"
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
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec-release.yml"
  }

  tags = local.ci_cd_tags

}

resource "aws_codepipeline" "common_codepipeline_release" {
  name     = "${var.common_app_name}-codepipeline-release"
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
        BranchName       = var.common_bitbucket_release_branch_name
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
        ProjectName = aws_codebuild_project.common_codebuild_release.name
      }
    }
  }

  tags = local.ci_cd_tags

}