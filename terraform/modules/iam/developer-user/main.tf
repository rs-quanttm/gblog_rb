data "aws_iam_policy" "AmazonSSMReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}

data "aws_iam_policy" "CloudWatchReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}

data "aws_iam_policy" "IAMUserChangePassword" {
  arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

data "aws_iam_policy" "AmazonS3ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

data "aws_iam_policy" "AWSCodeBuildReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AWSCodeBuildReadOnlyAccess"
}

data "aws_iam_policy" "AWSCodePipeline_ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AWSCodePipeline_ReadOnlyAccess"
}

data "aws_iam_policy" "AWSCodeDeployReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AWSCodeDeployReadOnlyAccess"
}

resource "aws_iam_user" "limited_permission" {
  name = var.name
}

resource "aws_iam_user_policy_attachment" "limited_user_ssm_read_only" {
  user       = aws_iam_user.limited_permission.name
  policy_arn = data.aws_iam_policy.AmazonSSMReadOnlyAccess.arn
}

resource "aws_iam_user_policy_attachment" "limited_user_cloudwatch_read_only" {
  user       = aws_iam_user.limited_permission.name
  policy_arn = data.aws_iam_policy.CloudWatchReadOnlyAccess.arn
}

resource "aws_iam_user_policy_attachment" "limited_user_change_password" {
  user       = aws_iam_user.limited_permission.name
  policy_arn = data.aws_iam_policy.IAMUserChangePassword.arn
}

resource "aws_iam_user_policy_attachment" "limited_user_s3_read_only" {
  user       = aws_iam_user.limited_permission.name
  policy_arn = data.aws_iam_policy.AmazonS3ReadOnlyAccess.arn
}

resource "aws_iam_user_policy_attachment" "limited_user_codebuild_read_only" {
  user       = aws_iam_user.limited_permission.name
  policy_arn = data.aws_iam_policy.AWSCodeBuildReadOnlyAccess.arn
}

resource "aws_iam_user_policy_attachment" "limited_user_codepipeline_read_only" {
  user       = aws_iam_user.limited_permission.name
  policy_arn = data.aws_iam_policy.AWSCodePipeline_ReadOnlyAccess.arn
}

resource "aws_iam_user_policy_attachment" "limited_user_codedeploy_read_only" {
  user       = aws_iam_user.limited_permission.name
  policy_arn = data.aws_iam_policy.AWSCodeDeployReadOnlyAccess.arn
}

resource "aws_iam_user_policy" "limited_permission" {
  name = "limited-permission-policy"
  user = aws_iam_user.limited_permission.name
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ecs:DiscoverPollEndpoint",
                "ecs:ListAttributes",
                "ecs:ExecuteCommand",
                "ecs:StartTask",
                "ecs:DescribeTaskSets",
                "ecs:DescribeTaskDefinition",
                "ecs:DescribeClusters",
                "ecs:ListServices",
                "ecs:ListAccountSettings",
                "ecs:DescribeCapacityProviders",
                "ecs:ListTagsForResource",
                "ecs:RunTask",
                "ecs:StartTelemetrySession",
                "ecs:ListTasks",
                "ecs:ListTaskDefinitionFamilies",
                "ecs:DescribeServices",
                "ecs:ListContainerInstances",
                "ecs:DescribeContainerInstances",
                "ecs:TagResource",
                "ecs:DescribeTasks",
                "ecs:UntagResource",
                "ecs:ListTaskDefinitions",
                "ecs:ListClusters"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
EOF
}
