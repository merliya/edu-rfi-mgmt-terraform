resource "aws_iam_role" "common_iam_role" {
  name                 = var.common_iam_role_name
  permissions_boundary = "arn:aws:iam::${var.account_id}:policy/security_pb"
  assume_role_policy   = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": [
                    "codepipeline.amazonaws.com",
                    "codedeploy.amazonaws.com",
                    "codebuild.amazonaws.com"
                ]
            },
            "Effect": "Allow"
        }
    ]
}
EOF

  tags = local.ci_cd_tags
}

resource "aws_iam_role_policy" "common_inline_policy" {
  name = "${var.common_app_name}_role_policy"
  role = aws_iam_role.common_iam_role.id

  policy = templatefile("common-iam-policy.json", {
    iam_role_name = var.common_iam_role_name
  })
}