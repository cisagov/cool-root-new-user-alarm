# ------------------------------------------------------------------------------
# Create an SNS topic in the Root account and subscribe the email associated
# with the Root account to that topic.
# ------------------------------------------------------------------------------

module "sns_new_user_alarms" {
  providers = {
    aws                         = aws.rootprovisionaccount
    aws.organizations_read_only = aws.organizationsreadonly
  }
  source = "github.com/cisagov/cw-alarm-sns-tf-module"

  topic_display_name = "new_user_alarms"
  topic_name         = "new_user_alarms"
}
