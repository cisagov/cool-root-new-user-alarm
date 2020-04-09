# ------------------------------------------------------------------------------
# Create the IAM policy that allows all of the permissions necessary
# to provision the new user CloudWatch alarm in the Users account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "provisionalarm" {
  statement {
    actions = [
      "cloudwatch:*",
    ]

    resources = [
      "arn:aws:cloudwatch:${var.aws_region}:${local.users_account_id}:alarm:UserAccountCreated",
    ]
  }
}

resource "aws_iam_policy" "provisionalarm" {
  provider = aws.usersprovisionaccount

  description = var.provisionalarm_policy_description
  name        = var.provisionalarm_policy_name
  policy      = data.aws_iam_policy_document.provisionalarm.json
}
