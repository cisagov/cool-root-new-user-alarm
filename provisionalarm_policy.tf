# ------------------------------------------------------------------------------
# Create the IAM policy that allows all of the permissions necessary
# to provision the new user CloudWatch alarm in the Root account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "provisionalarm" {
  statement {
    actions = [
      "cloudwatch:*",
    ]

    resources = [
      "arn:aws:cloudwatch:${var.aws_region}:${local.root_account_id}:alarm:UserAccountCreated",
    ]
  }

  statement {
    actions = [
      "logs:DeleteMetricFilter",
      "logs:DescribeMetricFilters",
      "logs:PutMetricFilter",
    ]

    resources = [
      "arn:aws:logs:${var.aws_region}:${local.root_account_id}:log-group:aws-controltower/CloudTrailLogs",
      "arn:aws:logs:${var.aws_region}:${local.root_account_id}:log-group:aws-controltower/CloudTrailLogs:log-stream:",
    ]
  }
}

resource "aws_iam_policy" "provisionalarm" {
  provider = aws.rootprovisionaccount

  description = var.provisionalarm_policy_description
  name        = var.provisionalarm_policy_name
  policy      = data.aws_iam_policy_document.provisionalarm.json
}
