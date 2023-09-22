# ------------------------------------------------------------------------------
# Retrieve the effective Account ID, User ID, and ARN in which
# Terraform is authorized.  This is used to calculate the session
# names for assumed roles.
# ------------------------------------------------------------------------------
data "aws_caller_identity" "current" {}

# ------------------------------------------------------------------------------
# Retrieve the information for all accounts in the organization.  This
# is used to lookup the Root account ID for use in the provisionalarm policy.
# ------------------------------------------------------------------------------
data "aws_organizations_organization" "cool" {
  provider = aws.organizationsreadonly
}

# ------------------------------------------------------------------------------
# Evaluate expressions for use throughout this configuration.
# ------------------------------------------------------------------------------
locals {
  # Extract the user name of the current caller for use as assume role
  # session names.
  caller_user_name = split("/", data.aws_caller_identity.current.arn)[1]

  # Find the Root account by name.
  root_account_id = [
    for x in data.aws_organizations_organization.cool.accounts :
    x.id if x.name == "CISA-COOL"
  ][0]
}
