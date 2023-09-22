# ------------------------------------------------------------------------------
# Attach to the ProvisionAccount role the IAM policy that allows
# provisioning of the new user CloudWatch alarm in the Root account.
# ------------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "provisionalarm" {
  provider = aws.rootprovisionaccount

  policy_arn = aws_iam_policy.provisionalarm.arn
  role       = var.provisionaccount_role_name
}
